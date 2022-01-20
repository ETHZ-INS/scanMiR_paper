cd /mnt/schratt/scanMiR_paper_scripts/Add_Datasets/Whipple/
salindex=/reference/Mus_musculus/GENCODE/GRCm38.p6/Annotation/Release_M20-2019-01-09/salmon_130/
rawfolder=rawfolder=/mnt/schratt/scanMiR_paper_scripts/Add_Datasets/Whipple/
mkdir -p salmon
for f in $(find *_[12].fastq.gz | sed s/_[12].fastq.gz// | sort -u); do
echo $f
/common/salmon-1.3.0/bin/salmon quant -q -l A -1 $f\_1.fastq.gz -2 $f\_2.fastq.gz --index $salindex -g $salindex/tx2gene -p 8 -o salmon/`basename $f .fastq.gz`
done
