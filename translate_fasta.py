
from Bio import SeqIO
from Bio.Seq import Seq

# Define input and output file paths (Example only for OG0000849 gene family)
input_file = '/gpfs01/home/mbxzd1/testfinal/OrthoFinder/Results_Jun28/Orthogroup_Sequences/OG0000849.fa'
output_file = '/gpfs01/home/mbxzd1/testfinal/OrthoFinder/Results_Jun28/Orthogroup_Sequences/OG0000849_protein.fa'

# Open input and output files
with open(input_file, 'r') as fasta_file, open(output_file, 'w') as output_handle:
    # Parse the input FASTA file
    sequences = SeqIO.parse(fasta_file, 'fasta')

    # Translate and write the protein sequences to the output file
    for sequence in sequences:
        # Ensure the sequence length is a multiple of three
        trimmed_seq = sequence.seq[:len(sequence.seq) // 3 * 3]

        # Translate the DNA sequence to protein
        protein_seq = Seq(str(trimmed_seq)).translate(table=1, to_stop=True)

        # Update the sequence object with the translated protein sequence
        sequence.seq = protein_seq

        # Write the sequence to the output file
        SeqIO.write(sequence, output_handle, 'fasta')

