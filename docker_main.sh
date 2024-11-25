#       =================================================================================================================
#    :                                                                                                                     :
#    :                                                                                                                     :
#    :              **                                   ===    ===   +++++++    ===                                       :
#    :             ****                                  ===         ++++++++++                                            :
#    :            ******     === ====  ====    == ====   ===    ==   +++     +++  ==   == ====      ====    === ===        :
#    :           ***  ***    ==== ===== ====  ====  ===  ===    ===  ++++++++++  ===  ====  ====  ===   ==  ======         :
#    :          **********   ===   ===   ===  ===   ===  ===    ===  +++++++     ===  ===-   === =========  ===            :
#    :         ************  ===   ===   ===  ===   ===  ====   ===  +++         ===  ====   ===  ===       ===            :
#    :        ***        *** ===   ===   ===  ========    ====  ===  +++         ===  =========    =======  ===            :
#    :                                        ===                                     ====                                 :
#    :                                        ==                                      ==                                   :
#       =================================================================================================================

### Welcome to the AmpliPiper Workshop at the NOBIS 2024 conference

# ======================================== Part II ===========================================

# (1) Set working directories

## AmpliPiper Workshop folder

WD='/app/userdata/'

## AmpliPiper Software

AMPLIPIPER='/app/'

# (2) generate samples.csv file for Syrphid Datasest

mkdir -p ${WD}/results/Syrphid
## print header for samples.csv
printf "ID,PATH\n" >${WD}/results/Syrphid/samples.csv

## loop through input FASTQ files
for Filepath in ${AMPLIPIPER}/testdata/reads/*fastq.gz; do

    ## get Filename
    Filename=${Filepath##*/}

    ## get File ID
    ID=${Filename%.fastq.gz*}

    ## print to samples.csv
    echo ${ID},${Filepath} >>${WD}/results/Syrphid/samples.csv
done

# (3) run AmpliPiper on Syrphid dataset

## automatically generates new output folder in AmpliPiper Workshop folder ${WD}/results/Syrphid/FirstTry

## !! Don't forget to adjust your email address (change your@email.com)
## !! Use a reasonable number of threads for your system

## execute Pipeline
bash ${AMPLIPIPER}/shell/AmpliPiper.sh \
    --samples ${WD}/results/Syrphid/samples.csv \
    --primers ${AMPLIPIPER}/testdata/data/primers.csv \
    --output ${WD}/results/Syrphid/demo \
    --quality 10 \
    --nreads 1000 \
    --blast your@email.com \
    --similar_consensus 97 \
    --threads 16 \
    --kthreshold 0.05 \
    --minreads 50 \
    --sizerange 100 \
    --outgroup He_mor_41 \
    --force

## ----> What do all the parameters mean? Check out the README file in the AmpliPiper repo

## (4) now explore the output

### On GitPod - start HTML preview to view output HTML in VScode

python -m http.server 8000

### The Output HTML should open automatically on LINUX.
### On a MAC, copy the PATH to the HTML and copy into your Browser

## ----> What do you see? (Investigate HTML and Output folder)
## ----> Why are there no additional haplotypes in diploid loci? (Check the tabular summary of the Consensus Seq reconstruction)
## ----> Are the phylogenies of all loci consistent? (Compare Phylogenies of single loci and of Super trees)

# (5) What happens, if we include ALL consensus sequences?

## execute Pipeline
bash ${AMPLIPIPER}/shell/AmpliPiper.sh \
    --samples ${AMPLIPIPER}/testdata/data/samples.csv \
    --primers ${AMPLIPIPER}/testdata/data/primers.csv \
    --output ${WD}/results/Syrphid/demo_all \
    --quality 10 \
    --nreads 1000 \
    --blast your@email.com \
    --similar_consensus 97 \
    --threads 16 \
    --kthreshold 0.05 \
    --minreads 50 \
    --sizerange 100 \
    --outgroup He_mor_41 \
    --force \
    --freqthreshold 0

# ======================================== Part III ===========================================

# In the second part, we will investigate some more complex datasets

# (1) Opiliones

## (a) generate samples file
echo \
    """ABOL24-0001.1,${WD}/datasets/Opiliones/data/reads/barcode21.fastq.gz
ABOL24-0005,${WD}/datasets/Opiliones/data/reads/barcode33.fastq.gz
ABOL24-0009,${WD}/datasets/Opiliones/data/reads/barcode45.fastq.gz
ABOL24-0011,${WD}/datasets/Opiliones/data/reads/barcode57.fastq.gz
ABOL24-0016,${WD}/datasets/Opiliones/data/reads/barcode69.fastq.gz
ABOL24-0017,${WD}/datasets/Opiliones/data/reads/barcode81.fastq.gz
ABOL24-0019,${WD}/datasets/Opiliones/data/reads/barcode93.fastq.gz
ABOL24-0020,${WD}/datasets/Opiliones/data/reads/barcode10.fastq.gz
""" >${WD}/datasets/Opiliones/files/samples.csv

## (b) run AmpliPiper

## modify parameters if you wish

bash ${AMPLIPIPER}/shell/AmpliPiper.sh \
    --samples ${WD}/datasets/Opiliones/data/samples.csv \
    --primers ${WD}/datasets/Opiliones/data/primers.csv \
    --output ${WD}/results/Opiliones/demo \
    --quality 10 \
    --nreads 1000 \
    --threads 16 \
    --kthreshold 0.05 \
    --blast your@email.com \
    --similar_consensus 97 \
    --minreads 50 \
    --sizerange 100 \
    --freqthreshold 0 \
    --force

## ----> What do you see? (Investigate HTML and Output folder)
## ----> How do you interpret?
## ----> repeat with other parameter combinations

# (2) Mercurialis

## (a) generate samples file

## print header for samples.csv
printf "ID,PATH\n" >${WD}/datasets/Mercurialis/data/samples.csv

## loop through input FASTQ files
for Filepath in ${WD}/datasets/Mercurialis/data/reads/*fastq.gz; do

    ## get Filename
    Filename=${Filepath##*/}

    ## get File ID
    ID=${Filename%.fastq.gz*}

    ## print to samples.csv
    echo ${ID},${Filepath} >>${WD}/datasets/Mercurialis/data/samples.csv
done

## (b) run AmpliPiper

## modify parameters if you wish

bash ${AMPLIPIPER}/shell/AmpliPiper.sh \
    --samples ${WD}/datasets/Mercurialis/data/samples.csv \
    --primers ${WD}/datasets/Mercurialis/data/primers.csv \
    --output ${WD}/results/Mercurialis/demo \
    --quality 10 \
    --nreads 1000 \
    --threads 16 \
    --kthreshold 0.05 \
    --blast your@email.com \
    --similar_consensus 97 \
    --minreads 50 \
    --sizerange 100 \
    --force
