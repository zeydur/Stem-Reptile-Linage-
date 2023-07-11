#!/bin/bash
#SBATCH --job-name=cafe2
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=179g
#SBATCH --time=24:00:00
#SBATCH --output=/gpfs01/home/mbxzd1/OandE/%x.out
#SBATCH --error=/gpfs01/home/mbxzd1/OandE/%x.err

# Run the command line directly in the direction of where your CAFE5 is installed

cafe5 -i cafe.input.tsv -t newicktree.newick -o caferesults
