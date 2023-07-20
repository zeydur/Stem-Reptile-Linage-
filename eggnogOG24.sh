#!/bin/bash
#SBATCH --job-name=emapper
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --mem=179g
#SBATCH --time=72:00:00
#SBATCH --output=/gpfs01/home/mbxzd1/OandE/emapper_%j.out
#SBATCH --error=/gpfs01/home/mbxzd1/OandE/emapper_%j.err


# Load required modules (if needed)
# module load module1 module2

# Activate the desired conda environment
source $HOME/.bash_profile
conda activate /gpfs01/home/mbxzd1/miniconda3/envs/eggnog_env

# Run the emapper.py command
python3 /gpfs01/home/mbxzd1/miniconda3/envs/eggnog_env/bin/emapper.py \
    -i /gpfs01/home/mbxzd1/testfinal/OrthoFinder/Results_Jun28/Orthogroup_Sequences/OG0000024_protein.fa \
    -o output_folderOG24 \
    --data_dir /gpfs01/home/mbxzd1/eggnog_data/ \
    --dbtype seqdb

python3 /gpfs01/home/mbxzd1/miniconda3/envs/eggnog_env/bin/emapper.py \
    -i /gpfs01/home/mbxzd1/testfinal/OrthoFinder/Results_Jun28/Orthogroup_Sequences/OG0000074_protein.fa \
    -o output_folderOG74 \
    --data_dir /gpfs01/home/mbxzd1/eggnog_data/ \
    --dbtype seqdb

python3 /gpfs01/home/mbxzd1/miniconda3/envs/eggnog_env/bin/emapper.py \
    -i /gpfs01/home/mbxzd1/testfinal/OrthoFinder/Results_Jun28/Orthogroup_Sequences/OG0000141_protein.fa \
    -o output_folderOG141 \
    --data_dir /gpfs01/home/mbxzd1/eggnog_data/ \
    --dbtype seqdb

python3 /gpfs01/home/mbxzd1/miniconda3/envs/eggnog_env/bin/emapper.py \
    -i /gpfs01/home/mbxzd1/testfinal/OrthoFinder/Results_Jun28/Orthogroup_Sequences/OG0000213_protein.fa \
    -o output_folderOG213 \
    --data_dir /gpfs01/home/mbxzd1/eggnog_data/ \
    --dbtype seqdb

python3 /gpfs01/home/mbxzd1/miniconda3/envs/eggnog_env/bin/emapper.py \
    -i /gpfs01/home/mbxzd1/testfinal/OrthoFinder/Results_Jun28/Orthogroup_Sequences/OG0000307_protein.fa \
    -o output_folderOG307 \
    --data_dir /gpfs01/home/mbxzd1/eggnog_data/ \
    --dbtype seqdb
python3 /gpfs01/home/mbxzd1/miniconda3/envs/eggnog_env/bin/emapper.py \
    -i /gpfs01/home/mbxzd1/testfinal/OrthoFinder/Results_Jun28/Orthogroup_Sequences/OG0000359_protein.fa \
    -o output_folderOG359 \
    --data_dir /gpfs01/home/mbxzd1/eggnog_data/ \
    --dbtype seqdb

python3 /gpfs01/home/mbxzd1/miniconda3/envs/eggnog_env/bin/emapper.py \
    -i /gpfs01/home/mbxzd1/testfinal/OrthoFinder/Results_Jun28/Orthogroup_Sequences/OG0000700_protein.fa \
    -o output_folderOG700 \
    --data_dir /gpfs01/home/mbxzd1/eggnog_data/ \
    --dbtype seqdb

python3 /gpfs01/home/mbxzd1/miniconda3/envs/eggnog_env/bin/emapper.py \
    -i /gpfs01/home/mbxzd1/testfinal/OrthoFinder/Results_Jun28/Orthogroup_Sequences/OG0000849_protein.fa \
    -o output_folderOG849 \
    --data_dir /gpfs01/home/mbxzd1/eggnog_data/ \
    --dbtype seqdb
