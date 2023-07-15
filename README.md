# Molecular Innovations of Stem Reptile Linage

The aim of this M.Sc. Bioinformatics individual project is to conduct a genome-scale investigation of molecular innovations on the stem lineage of reptiles. The primary objective is to identify evolutionary events such as expansions and contractions of specific gene families within reptilian species. By analyzing these gene families, the unique traits that contribute to the distinctiveness of reptiles will be defined and characterized. For this purpose, several steps were performed to achieve the objectives of the project. The following steps were undertaken:

## Explanation of Environment and General Prequisites
The scripts were created in the Miniconda3 environment, requiring prior installation, and executed using Git Bash on the Augusta High Performance Computing (HPC) system.
A separate environment was created for each tool, and the following example shows the command used for running each tool:

````
conda create --prefix /directory/ busco

conda activate /directory/busco

conda install -c bioconda busco

or

conda install -c conda-forge -c bioconda busco=5.4.7 (if specific version is required)
````

## Methods

### 1. Genome Collection
The data used in this project was obtained through several sources including National Center for Biotechnology Information (NCBI) – Genome (regarding to the latest releases - 2023), Ensembl – Biomart (Ensembl Release 109, 2023) and Iguana consortium. Genome coding sequences of reference genomes as in FASTA format files were downloaded from NCBI-Genome and only coding sequences were downloaded from Ensembl-Biomart, then the files were modified by addition of the common names to the headers. The Iguana genomes were directly derived from Iguana Consortium, and they have performed BRAKER v.2.1.6 for prediction of protein coding gene structures in cooperation with TSEBRA (Gabriel, L., Hoff, K.J., Brůna, T. et al., 2021) to predict the structures and generate the coding sequences, furthermore similar modifications were applied to those data files. In total 37 genomes from different classes were obtained (24 species from reptilia, 6 mammalia, 3 amphibia, 4 aves).

* The example command for modification of FASTA files:

``sed "s/^>/>Chinesesoftshellturtle_/" Softshellturt/ncbi_dataset/data/GCF_000230535.1/cds_from_genomic.fna > ChineseSoftshellTurtle.fa``

### 2. Investigation of Completeness as Quality Control for Genome Assemblies
To assess genome annotation completeness, BUSCO v5.4.7 (et al.) software was employed by quantifying the proportions of complete, fragmented and missing from gene sets derived from last step with default parameters. For mandatory arguments, ``--input`` was set as ``FASTA files`` from genome collection step, ``--lineage`` was set as ``vertebrata_odb10`` and ``--mode`` was set as ``genome`` on each GenBank, Ensembl and Iguana consortium assembly. 3354 BUSCOs from the ``‘vertebrata_odb10’`` was employed and the dependencies were identified for the research as HMMsearch v3.1. and bbtools v39.01.

- The script used:

[busco.sh](busco.sh)

#### 2.1. Creating the graphs for interpretation of BUSCO summary
Further details were presented using the generate_plot.py script, which utilizes the R package (https://www.r-project.org/) and ggplot2 (http://ggplot2.org/) to generate plots and enhance the visualization of the data. 
For that purpose HPC-Tomoko which has already had R package was employed since some problems occured during installation of R package. The initial step was transferring whole short_summary.txt files to the Tomoko by using ``"scp -i ssh mbxzd1@10.156.32.52  /Users/zeynep/Downloads/Busco/short_summary.specific.vertebrata_odb10.OUTPUT_*  mbxzd1@10.156.32.52:/home/mbxzd1"`` command. This step is followed by making the specific directoy ``"mkdir busco_summaries"`` in the home directory and moving those files into that directory. 

* Then R package must be started and ggpot2 must be installed personal library by following those commands:

``install.packages("ggplot2")`` 

``q(save="no")``

* This step is followed by changing the working directory into the where BUSCO has been installed and then to bin (which contains the related Python command), the example command:

``cd /home/mbxzd11/miniconda3/envs/busco/bin``

* To obtain the graps for BUSCO results, run script:

``python3 generate_plot.py --working_directory /home/mbxzd1/busco_summaries``


### 3. Orthology and Gene Family Inference
The main goals of usage of OrthoFinder (version) are identification orthologs, orthogroups and duplicated genes; construction of gene families accross mutlitple species. Therefore, initial step as sequence alignment was performed by DIAMOND (version) which was the perquisite for OrthoFinder analysis. Then, phylogenetical analysis was conducted to investigate relationships between orthogroups based on the gene families. For those projections, FASTA files from first step was employed as an input file. 

* The script used:

[orthofinder.sh](orthofinder.sh)

### 4. Divergence Time Estimation
The intricate web of phylogenetic relationships was illuminated by the comprehensive timetree formulated in the seminal study led by [James R., Portik D. M., Zheng Y., Thomson R. C. et al.]. Employing sophisticated molecular dating methods, TimeTree facilitated the determination of divergence times between nodes, carefully considering the adjusted median times as crucial benchmarks. The species tree, incorporating divergence times, was visually represented using iTOL v.6 (Interactive Tree Of Life) software and FigTree v.1.4.4 software.

* You can find the ultrameric, Newick tree:

[NewickTree](NewickTree)

### 5. Evolution of Gene Families
CAFÉ v.5 was used for the purpose of detect the gene families exhibiting notable rapid expansions and contractions in gene copy numbers exclusively in tetrapoda lineage (the genomes table). This analysis encompassed the ***** orthologous groups accessible in Orthofinder. By leveraging the ultarmeric tree (based on the divergence times) and accounting the gene family copy numbers, CAFÉ5 initiates the estimation of the evolution of the gene families. . In CAFE5, the default parameters for input and tree are designated as "--input" and "--tree," respectively. The input file, named Orthogroups.GeneCount.tsv, is generated through the use of OrthoFinder.  However, it is necessary to modify the Orthogroups.GeneCount.tsv file to be compatible with CAFE5. This modification involves converting the file to tab-separated format and removing the total gene count column before it can be processed by CAFE5. Furthermore, the tree in Newick format, is obtained directly from the preceding step of the methodology.

#### 5.1. Preparing the files for CAFE5 analysis

* The first step modifying the .tsv file to obtain the tab-separated format file:

``awk -F'\t' '{print "(null)\t"$0}' Orthogroups.GeneCount.tsv > tmp.tsv``

* Then the header of first column was (which was (null)) changed to Desc:

``sed -i '1 s/(null)/Desc/' tmp.tsv``

* After that the total column was excluded:

``awk -F'\t' '{$NF=""; print $0}' tmp.tsv | rev | sed 's/^\s*//g' | rev | tr ' ' '\t' > mod.tsv``

* Lastly to filter the Orthogroups.GeneCount.tsv file to remove OG that have more than 100 proteins in a particular species the script (done by Fabio H. K. Mendes) had run:
  
[cafetutorial_clade_and_size_filter.py](cafetutorial_clade_and_size_filter.py)

* The run comman for this python script:

``python3 cafe.py -i mod.tsv -s -o cafe.input.tsv``


* The example command:

``cafe5 -i cafe.input.tsv -t newicktree.newick -o caferesults``

or it can be run as in Bash script (which has been used):

[cafe.sh](cafe.sh)

* To visualize the outcomes of the CAFE analysis following script had run:
* 




