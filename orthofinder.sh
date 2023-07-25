#!/bin/bash
#SBATCH --job-name=orthtrytestfinal
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --mem=179g
#SBATCH --time=72:00:00
#SBATCH --output=/gpfs01/home/mbxzd1/OandE/%x.out
#SBATCH --error=/gpfs01/home/mbxzd1/OandE/%x.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate orthofinder

#Make a new directory
mkdir /gpfs01/home/mbxzd1/testfinal/

#After activation run the orthofinder with default parameters
orthofinder -d -f /gpfs01/home/mbxzd1/testfinal/
