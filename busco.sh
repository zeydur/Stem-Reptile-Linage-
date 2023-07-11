#!/bin/bash
#SBATCH --job-name=Busco_results
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --mem=179g
#SBATCH --time=72:00:00
#SBATCH --output=/shared/home/mbxzd1/OandE/%x.out
#SBATCH --error=/shared/home/mbxzd1/OandE/%x.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate busco

#After activation run the busco with default parameters
busco -i Aeolianwalllizard.fa -m genome -l vertebrata_odb10 -o OUTPUT_Aeolianwalllizard
busco -i Africansavannaelephant.fa -m genome -l vertebrata_odb10 -o OUTPUT_Africansavannaelephant
busco -i Americanalligatorz.fa -m genome -l vertebrata_odb10 -o OUTPUT_Americanalligator
busco -i Amblyrhynchuscristatusz.fa -m genome -l vertebrata_odb10 -o OUTPUT_Amblyrhynchuscristatusz
busco -i Armadd.fa -m genome -l vertebrata_odb10 -o OUTPUT_Armadd
busco -i Boxturtled.fa  -m genome -l vertebrata_odb10 -o OUTPUT_Boxturtled
busco -i Collardflycatcherd.fa -m genome -l vertebrata_odb10 -o OUTPUT_Collardflycatcherd
busco -i Conolophusmarthaez.fa -m genome -l vertebrata_odb10 -o OUTPUT_Conolophusmarthaez
busco -i Conolophuspallidusz.fa -m genome -l vertebrata_odb10 -o OUTPUT_Conolophuspallidusz
busco -i Commonostrichz.fa -m genome -l vertebrata_odb10 -o OUTPUT_Commonostrichz
busco -i Conolophussubcristatus.fa -m genome -l vertebrata_odb10 -o OUTPUT_Conolophussubcristatus
busco -i Ctenosaurabakerid.fa -m genome -l vertebrata_odb10 -o OUTPUT_Ctenosaurabakerid
busco -i Cycluracarinataz.fa -m genome -l vertebrata_odb10 -o OUTPUT_Cycluracarinataz.fa
busco -i Eastbrownsnaked.fa  -m genome -l vertebrata_odb10 -o OUTPUT_Eastbrownsnaked.fa 
busco -i Cowd.fa -m genome -l vertebrata_odb10 -o OUTPUT_Cowd
busco -i Diamondblackterrapinz.fa -m genome -l vertebrata_odb10 -o OUTPUT_Diamondblackterrapinz
busco -i Emu.fa -m genome -l vertebrata_odb10 -o OUTPUT_Emu
busco -i Gharid.fa  -m genome -l vertebrata_odb10 -o OUTPUT_Gharid
busco -i Goldeneagled.fa -m genome -l vertebrata_odb10 -o OUTPUT_Goldeneagled
busco -i Gophertortoised.fa -m genome -l vertebrata_odb10 -o OUTPUT_Gophertortoised
busco -i Greenanoledd.fa -m genome -l vertebrata_odb10 -o OUTPUT_Greenanoledd
busco -i Greenseaturtledd.fa  -m genome -l vertebrata_odb10 -o OUTPUT_Greenseaturtledd
busco -i Humand.fa -m genome -l vertebrata_odb10 -o OUTPUT_Humand
busco -i Iguanadelicatissima.fa -m genome -l vertebrata_odb10 -o OUTPUT_Iguanadelicatissima
busco -i Oposd.fa -m genome -l vertebrata_odb10 -o OUTPUT_ Oposd
busco -i Platyd.fa -m genome -l vertebrata_odb10 -o OUTPUT_Platyd
busco -i Clawedfrog.fa -m genome -l vertebrata_odb10 -o OUTPUT_Clawedfrog
busco -i Saltwatercrocd.fa -m genome -l vertebrata_odb10 -o OUTPUT_Saltwatercrocd
busco -i Seaturtled.fa -m genome -l vertebrata_odb10 -o OUTPUT_Seaturtled
busco -i Softturtd.fa -m genome -l vertebrata_odb10 -o OUTPUT_Softturtd
busco -i Tigersnaked.fa -m genome -l vertebrata_odb10 -o OUTPUT_Tigersnaked
busco -i Tinycayenned.fa -m genome -l vertebrata_odb10 -o OUTPUT_ Tinycayenned
busco -i Tortoised.fa -m genome -l vertebrata_odb10 -o OUTPUT_Tortoised.fa
busco -i TuataraA.fa -m genome -l vertebrata_odb10 -o OUTPUT_TuataraA
busco -i Twolinedd.fa -m genome -l vertebrata_odb10 -o OUTPUT_Twolinedd
busco -i Walllizardd.fa -m genome -l vertebrata_odb10 -o OUTPUT_Walllizardd
busco -i Westernsnaked.fa -m genome -l vertebrata_odb10 -o OUTPUT_Westernsnaked








