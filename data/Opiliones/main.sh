## Set working directory
WD='<path/here>'
# e.g. WD=/media/inter/mkapun/projects/AmpliPiper_Workshop24/data/Opiliones

## make input file for the samples
echo \
    """ABOL24-0001.1,${WD}/data/raw_reads/barcode21.fastq.gz
ABOL24-0005,${WD}/data/raw_reads/barcode33.fastq.gz
ABOL24-0009,${WD}/data/raw_reads/barcode45.fastq.gz
ABOL24-0011,${WD}/data/raw_reads/barcode57.fastq.gz
ABOL24-0016,${WD}/data/raw_reads/barcode69.fastq.gz
ABOL24-0017,${WD}/data/raw_reads/barcode81.fastq.gz
ABOL24-0019,${WD}/data/raw_reads/barcode93.fastq.gz
ABOL24-0020,${WD}/data/raw_reads/barcode10.fastq.gz
""" >${WD}/data/samples.csv

### run AmpliPiper
bash /media/inter/pipelines/AmpliPiper/shell/AmpliPiper.sh \
    --samples ${WD}/data/samples.csv \
    --primers ${WD}/data/primers.csv \
    --output ${WD}/AllCons \
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
