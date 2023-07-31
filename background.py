def extract_gene_ids_from_fasta(fasta_file):
    gene_ids = []
    with open(fasta_file, 'r') as f:
        for line in f:
            if line.startswith('>'):
                # Assuming the gene ID is the first word after '>'
                gene_id = line.strip()[1:].split()[0]
                gene_ids.append(gene_id)
    return gene_ids

# Replace "single_copy_orthrogrup.fasta" with the actual path to your FASTA file
fasta_file = "/gpfs01/home/mbxzd1/testfinal/OrthoFinder/Results_Jun28/Orthogroup_Sequences/"

# Extract gene IDs from the FASTA file
gene_ids = extract_gene_ids_from_fasta(fasta_file)

# Create the "background_genes.txt" file
output_file = "background_genes.txt"
with open(output_file, 'w') as f:
    for gene_id in gene_ids:
        f.write(f"{gene_id}\n")

print(f"Background Population Gene List saved to {output_file}.")
