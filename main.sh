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

# ======================================== Part I ===========================================

# (1) Set working directories

## AmpliPiper Workshop folder

## a) when using GitPod:
WD='/workspace/AmpliPiper_Workshop_2024'
## b) else change to your local path to this repo
WD='<your/local/path/to/AmpliPiper_Workshop_2024'

## AmpliPiper Software

## a) when using GitPod:
AMPLIPIPER='/app/'
## b) else change to your local path to this repo
AMPLIPIPER='<your/local/path/to/AmpliPiper'

# (2) generate samples.csv file for Syrphid Datasest

## print header for samples.csv
printf "ID,PATH\n" >${AMPLIPIPER}/testdata/data/samples.csv

## loop through input FASTQ files
for Filepath in ${AMPLIPIPER}/testdata/reads/*fastq.gz; do

    ## get Filename
    Filename=${Filepath##*/}

    ## get File ID
    ID=${Filename%.fastq.gz*}

    ## print to samples.csv
    echo ${ID},${Filepath} >>${AMPLIPIPER}/testdata/data/samples.csv
done

# (3) run AmpliPiper on Syrphid dataset

## automatically generates new output folder in AmpliPiper Workshop folder ${WD}/results/Syrphid/FirstTry

## !! Don't forget to adjust your email address (change your@email.com)
## !! Use a reasonable number of threads for your system

## execute Pipeline
bash ${AMPLIPIPER}/shell/AmpliPiper.sh \
    --samples ${AMPLIPIPER}/testdata/data/samples.csv \
    --primers ${AMPLIPIPER}/testdata/data/primers.csv \
    --output ${WD}/results/Syrphid/FirstTry \
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

# ======================================== Part II ===========================================

## make input file for the samples
echo \
    """ABOL24-0001.1,${WD}/data/Opiliones/raw_reads/barcode21.fastq.gz
ABOL24-0005,${WD}/data/Opiliones/raw_reads/barcode33.fastq.gz
ABOL24-0009,${WD}/data/Opiliones/raw_reads/barcode45.fastq.gz
ABOL24-0011,${WD}/data/Opiliones/raw_reads/barcode57.fastq.gz
ABOL24-0016,${WD}/data/Opiliones/raw_reads/barcode69.fastq.gz
ABOL24-0017,${WD}/data/Opiliones/raw_reads/barcode81.fastq.gz
ABOL24-0019,${WD}/data/Opiliones/raw_reads/barcode93.fastq.gz
ABOL24-0020,${WD}/data/Opiliones/raw_reads/barcode10.fastq.gz
""" >${WD}/data/Opiliones/files/samples.csv

### run AmpliPiper
bash /app/shell/AmpliPiper.sh \
    --samples ${WD}/data/Opiliones/files/samples.csv \
    --primers ${WD}/data/Opiliones/files/primers.csv \
    --output ${WD}/Opiliones/results/demo/ \
    --quality 10 \
    --nreads 1000 \
    --threads 100 \
    --kthreshold 0.1 \
    --blast your@email.com \
    --similar_consensus 97 \
    --minreads 50 \
    --sizerange 100 \
    --freqthreshold 0 \
    --force
