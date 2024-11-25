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

## 1) Set working directory

## a) when using GitPod:
WD='/workspace/AmpliPiper_Workshop_2024'
## b) else change to your local path to this repo
WD='<your/local/path/to/AmpliPiper_Workshop_2024'

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
