#!/bin/bash
#SBATCH --job-name=cafe2
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=179g
#SBATCH --time=24:00:00
#SBATCH --output=/gpfs01/home/mbxzd1/OandE/%x.out
#SBATCH --error=/gpfs01/home/mbxzd1/OandE/%x.err

# These steps are required to activate Conda

cafe5 -i mod.tsv -t newicktree.newick -o cafresults2
