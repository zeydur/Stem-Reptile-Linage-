# Function to extract Gene ID and associated GO terms from Eggnog output line
def extract_gene_id_and_go_terms(line):
    line_parts = line.strip().split('\t')
    if len(line_parts) >= 9:
        gene_id = line_parts[0]
        go_terms = line_parts[8].split(',')
        return gene_id, go_terms
    else:
	return None, None

# Input and Output file paths
eggnog_output_file = "output_folderOG849.emapper.annotations"  # Replace with the path to your Eggnog output file
gene_id_file = "gene_ids849.txt"

# Dictionary to store Gene IDs and associated GO terms
gene_id_to_go_terms = {}

# Parse the Eggnog output file and extract Gene IDs with their GO terms
with open(eggnog_output_file, 'r') as f:
    header = f.readline()  # Skip the header line
    for line in f:
        gene_id, go_terms = extract_gene_id_and_go_terms(line)
        if gene_id and go_terms:
            if gene_id not in gene_id_to_go_terms:
                gene_id_to_go_terms[gene_id] = set()
            gene_id_to_go_terms[gene_id].update(go_terms)

# Save Gene IDs to the output file
with open(gene_id_file, 'w') as f:
    for gene_id in gene_id_to_go_terms:
        f.write(gene_id + '\n')
