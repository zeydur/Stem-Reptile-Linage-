# Molecular Innovations of Stem Reptile Linage

The aim of this M.Sc. Bioinformatics individual project is to conduct a genome-scale investigation of molecular innovations on the stem lineage of reptiles. The primary objective is to identify evolutionary events such as expansions and contractions of specific gene families within reptilian species. By analyzing these gene families, the unique traits that contribute to the distinctiveness of reptiles will be defined and characterized. For this purpose, several steps were performed to achieve the objectives of the project. The following steps were undertaken:

## Explanation of Environment and General Prequisites
The scripts were created in the Miniconda3 environment, requiring prior installation, and executed using Git Bash on the Augusta High Performance Computing (HPC) system.
A separate environment was created for each tool, and the following example shows the command used for running each tool:

````
conda create --prefix /directory/busco

conda activate /directory/busco

conda install -c bioconda busco

or

conda install -c conda-forge -c bioconda busco=5.4.7 (if specific version is required)
````

## Methods

### 1. Genome Collection
The data used in this project was obtained through several sources including ``National Center for Biotechnology Information`` (NCBI) – Genome (regarding to the latest releases - 2023), ``Ensembl – Biomart`` (Ensembl Release 109, 2023) and ``Iguana consortium``. Genome coding sequences of reference genomes as in FASTA format files were downloaded from NCBI-Genome and only coding sequences were downloaded from Ensembl-Biomart, then the files were modified by addition of the common names to the headers. The Iguana genomes were directly derived from Iguana Consortium, and they have performed ``BRAKER`` v.2.1.6 for prediction of protein coding gene structures in cooperation with ``TSEBRA`` (Gabriel, L., Hoff, K.J., Brůna, T. et al., 2021) to predict the structures and generate the coding sequences, furthermore similar modifications were applied to those data files. In total 37 genomes from different classes were obtained (24 species from reptilia, 6 mammalia, 3 amphibia, 4 aves).

* The example command for modification of FASTA files:

``sed "s/^>/>Chinesesoftshellturtle_/" Softshellturt/ncbi_dataset/data/GCF_000230535.1/cds_from_genomic.fna > ChineseSoftshellTurtle.fa``

### 2. Investigation of Completeness as Quality Control for Genome Assemblies
To assess genome annotation completeness, ``BUSCO`` v5.4.7 (Manni, M. et al., 2021) software was employed by quantifying the proportions of complete, fragmented and missing from gene sets derived from last step with default parameters. For mandatory arguments, ``--input`` was set as ``FASTA files`` from genome collection step, ``--lineage`` was set as ``vertebrata_odb10`` and ``--mode`` was set as ``genome`` on each GenBank, Ensembl and Iguana consortium assembly. 3354 BUSCOs from the ``‘vertebrata_odb10’`` was employed and the dependencies were identified for the research as ``HMMsearch`` v3.1. (Eddy S.R. ,2011) and ``bbtools`` v39.01 (Bushnell B., 2021).

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

* The image of the graph:

[busco_figure.png](busco_figure.png)


### 3. Orthology and Gene Family Inference
The main goals of usage of ``OrthoFinder`` (version 2.5.5) (Emms D. M. et al., 2019)  are identification orthologs, orthogroups and duplicated genes; construction of gene families accross mutlitple species. Therefore, initial step as sequence alignment was performed by ``DIAMOND`` (2.1.7) (Buchfink B. et al., 2015)  which was the perquisite for OrthoFinder analysis. Then, phylogenetical analysis was conducted to investigate relationships between orthogroups based on the gene families. For those projections, FASTA files from first step was employed as an input file. 

* The script used:

[orthofinder.sh](orthofinder.sh)

* How we found the Orthogroups number:

Move the directory to the Orthofinder/Orthogroups first, then

``tail -n +2 Orthogroups.txt | wc -l``

* How we count the Terminal and Non-terminal OGs:

Move the directory to the Orthofinder/Gene_Duplication_Events, then

``grep -o $'\tTerminal\t' Duplications.tsv | wc -l``

``grep -o $'\tNon-Terminal\t' Duplications.tsv | wc -l``

* To count significant families at the p=0.05 threshold:

````
grep -c "\y" Base_family_results.txt = 1306
grep "y" Base_family_results.txt > Significant_families.txt
````

### 4. Divergence Time Estimation
The intricate web of phylogenetic relationships was illuminated by the comprehensive timetree formulated in the seminal study led by [James R., Portik D. M., Zheng Y., Thomson R. C. et al.]. Employing sophisticated molecular dating methods, ``TimeTree`` facilitated the determination of divergence times between nodes, carefully considering the adjusted median times as crucial benchmarks. The species tree, incorporating divergence times, was visually represented using ``iTOL v.6`` (Interactive Tree Of Life) software and ``FigTree v.1.4.4`` software.

* You can find the ultrameric, Newick tree:

[NewickTree](NewickTree)

### 5. Evolution of Gene Families
``CAFÉ`` v.5 (Fábio K. Mendes et al., 2020) was used for the purpose of detect the gene families exhibiting notable rapid expansions and contractions in gene copy numbers exclusively in Tetrapoda lineage (Supplementary Table 1.1.). This analysis encompassed the 99,853 orthologous groups accessible in Orthofinder. By leveraging the ultarmeric tree (based on the divergence times) and accounting the gene family copy numbers, CAFÉ5 initiates the estimation of the evolution of the gene families. In CAFE5, the default parameters for input and tree are designated as ``"--input" and "--tree"`` respectively. The input file, named Orthogroups.GeneCount.tsv, is generated through the use of OrthoFinder.  However, it is necessary to modify the Orthogroups.GeneCount.tsv file to be compatible with CAFE5. This modification involves converting the file to tab-separated format and removing the total gene count column before it can be processed by CAFE5. Furthermore, the tree in Newick format, is obtained directly from the preceding step of the methodology. The final likelihood and birth-death parameter (λ) were employed to investigate the gain-loss of gene probabilities through the tree, and furthermore different P-values (0.05, 0.01) were utilized to investigate the significance of expansions and contractions.
In order to visualize, summary of significant gene family expansions and contractions ``CafePlotter`` which requires 3.8 or higher versions of Python was utilized, and species trees were obtained. 

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

#### 5.2. Visualization of the outcomes from CAFE5 analysis

* To visualize the outcomes of the CAFE analysis following script had run (taken from https://github.com/hahnlab/CAFE5/):

[cafe_draw_tree.py](cafe_draw_tree.py)

* Example run command:

* Move your directory to the Results of CAFE5 initially and then run:

``python3 cafe_draw_tree.py -i Base_clade_results.txt -d Base_results.txt -o clade_results.png``

or 

* The ``CafePlotter`` tool can be installed, directory can be created and regarding to the directory of the CAFE5 results the plot can be obtained by following commands:

````
pip install cafeplotter

mkdir cafeplot 

cafeplotter -i RESULTS_CAFE/ -o cafeplot/
````

* Then in the directory of cafeplot, ``summary_all_gene_family.png`` and ``summary_significant_gene_family.png`` can be found.

### 6. Gene Ontology Analysis

``EggNOG Mapper`` v2.1.9 (Carlos P. Cantalapiedra et al., 2021) was employed to identify or classify the gene of interest in manner of their functions, locations and processes that are playing role. This analysis employs the significant gene families which were obtained from CAFÉ5 analysis, here we have focused on only eight gene families, by searching the significant expansions and contractions on the Reptilian branch by determining the relevant node (<67>), file from Base_asr.tre from CAFÉ5 outputs. The compatible input file for the eggNOG must contain the protein sequences, Orthogroup_Sequences directory from Orthofinder provides FASTA files for each gene family, and they were converted from DNA sequences to protein sequences by [translate_fasta.py](translate_fasta.py). Then [eggnogOG24.sh](eggnogOG24.sh) was employed to obtain the gene ontology results which requires several default parameters as ``- -data-dir “eggnog_data”`` which provides EggNog database and ``- -dbtype “seqdb”`` which provides sequence database, both of which employed for orthology prediction and functional analysis. 

* The run command for translation:

python3 [translate_fasta.py](translate_fasta.py)

* To perform EggeNOG analysis:

sbatch [eggnogOG24.sh](eggnogOG24.sh)

### 7. GO Enrichment Analysis

In order to investigate the overrepresented, underrepresented or enriched GO terms ``Goatools`` (Klopfenstein DV, et al., 2018) was utilized which is a specific Python package. Principle relies on files that are known as obo-formatted from Gene Ontology website (http://geneontology.org) and structure is considered as directed acyclic graph (DAG). To perform enrichment analysis, the python code find_enrichment.py had been run by taking important arguments: ``1) the file that contains gene IDs for 8 orthogroups which are relavent to our study``, ``2) the file that contains gene IDs for every orthogroups from OrthoFinder as background of the study`` and ``3) an association file which contains the GO terms and their gene IDs from EggNOG outputs``. For that purpose, different ``p-values`` can be employed to test the significance of enrichment (GO term concentration significantly higher compared to background) or purification (significantly lower). 

* To obtain the Gene ID file:

The example run command must be:

python3 [gene_ids.py](gene_ids.py)

* To obtain the Background file:

The example run command must be:

python3 [background.py](background.py)

* To obtain the Association file:

The example run command must be:

python3 [association.py](association.py)

* Then the gene ID files need to be modifed to get a compatible file for Goatools:

``sed 's/,/;/g' gene_association_eggnog359.txt > test_gene_association_eggnog359.txt``

* The example run command for Goatools for one the orthogroup:

``python3 /gpfs01/home/mbxzd1/miniconda3/bin/find_enrichment.py --pval=0.05 --indent gene_ids359.txt background_geneszey.txt test_gene_association_eggnog359.txt --outfile=goea_results359.tsv --obo data/go-basic.obo``

