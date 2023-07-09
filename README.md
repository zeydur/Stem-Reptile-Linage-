# Molecular Innovations of Stem Reptile Linage

The aim of this M.Sc. Bioinformatics individual project is to conduct a genome-scale investigation of molecular innovations on the stem lineage of reptiles. The primary objective is to identify evolutionary events such as expansions and contractions of specific gene families within reptilian species. By analyzing these gene families, the unique traits that contribute to the distinctiveness of reptiles will be defined and characterized. For this purpose, several steps were performed to achieve the objectives of the project. The following steps were undertaken:

## Explanation of Environment and General Prequisites
The scripts were created in the Miniconda3 environment, requiring prior installation, and executed using Git Bash on the Augusta High Performance Computing (HPC) system.
A separate environment was created for each tool, and the following example shows the command used for running each tool:
conda create --prefix /directort/ busco

conda activate /directory/busco

conda install -c bioconda bsuco
or
conda install -c conda-forge -c bioconda busco=5.4.7 (if specific version is required)

## Methods

### 1. Genome Collection
The data used in this project was obtained through several sources including National Center for Biotechnology Information (NCBI) – Genome (regarding to the latest releases - 2023), Ensembl – Biomart (Ensembl Release 109, 2023) and Iguana consortium. Genome coding sequences of reference genomes as in FASTA format files were downloaded from NCBI-Genome and only coding sequences were downloaded from Ensembl-Biomart, then the files were modified by addition of the common names to the headers. The Iguana genomes were directly derived from Iguana Consortium, and they have performed BRAKER v.2.1.6 for prediction of protein coding gene structures in cooperation with TSEBRA to predict the structures and generate the coding sequences, furthermore similar modifications were applied to those data files. In total 37 genomes from different classes were obtained (24 species from reptilia, 6 mammalia, 3 amphibia, 4 aves).

### 2. Investigation of Completeness as Quality Control for Genome Assemblies
To assess genome annotation completeness, BUSCO v5.4.7 (et al.) software was employed by quantifying the proportions of complete, fragmented and missing from gene sets derived from last step with default parameters. For mandatory arguments, --input was set as FASTA files from genome collection step, --lineage was set as vertebrata_odb10 and --mode was set as genome on each GenBank, Ensembl and Iguana consortium assembly. 3354 BUSCOs from the ‘vertebrata_odb10’ was employed and the dependencies were identified for the research as HMMsearch v3.1. and bbtools v39.01.
The script used:


### 3. Divergence Time Estimation
The intricate web of phylogenetic relationships was illuminated by the comprehensive timetree formulated in the seminal study led by [James R., Portik D. M., Zheng Y., Thomson R. C. et al.]. Employing sophisticated molecular dating methods, TimeTree facilitated the determination of divergence times between nodes, carefully considering the adjusted median times as crucial benchmarks. The species tree, incorporating divergence times, was visually represented using iTOL v.6 (Interactive Tree Of Life) software and FigTree v.1.4.4 software.

### 4. Orthology and Gene Family Inference
The main goals of usage of OrthoFinder (version) are identification orthologs, orthogroups and duplicated genes; construction of gene families accross mutlitple species. Therefore, initial step as sequence alignment was performed by DIAMOND (version) which was the perquisite for OrthoFinder analysis. Then, phylogenetical analysis was conducted to investigate relationships between orthogroups based on the gene families. For those projections, FASTA files from first step was employed as an input file. 
The script used:

### 5. Evolution of Gene Families
CAFÉ v.5 was used for the purpose of detect the gene families exhibiting notable rapid expansions and contractions in gene copy numbers exclusively in tetrapoda lineage (the genomes table). This analysis encompassed the ***** orthologous groups accessible in Orthofinder. By leveraging the ultarmeric tree (based on the divergence times) and accounting the gene family copy numbers, CAFÉ5 initiates the estimation of the evolution of the gene families. 
The command used:






