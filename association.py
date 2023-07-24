# Replace "eggnog_results.txt" with the actual path to your Eggnog file
eggnog_file = "output_folderOG849.emapper.annotations"


# Create a dictionary to store the gene-to-GO term associations
gene_associations = {}

# Read the Eggnog file and extract gene IDs and GO terms
with open(eggnog_file, 'r') as f:
    for line in f:
        if line.startswith("#query"):
            continue
        line_parts = line.strip().split('\t')
        if len(line_parts) >= 10:
            gene_id, go_terms = line_parts[0], line_parts[9]
            gene_associations[gene_id] = go_terms

# Create the "gene_association_eggnog.txt" file
output_file = "gene_association_eggnog849.txt"
with open(output_file, 'w') as f:
    for gene_id, go_terms in gene_associations.items():
        f.write(f"{gene_id}\t{go_terms}\n")

print(f"Gene-to-GO term associations saved to {output_file}.")
