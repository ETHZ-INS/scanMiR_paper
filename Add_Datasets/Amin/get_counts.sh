salindex=/reference/Mus_musculus/GENCODE/GRCm38.p6/Annotation/Release_M20-2019-01-09/salmon_130/
rawfolder=/mnt/schratt/p1006/Amin_2015/raw/
mkdir -p salmon
files=`ls /mnt/schratt/p1006/Amin_2015/raw/*.fastq.gz`
for f in $files; do
echo $f
/common/salmon-1.3.0/bin/salmon quant -q -l A -r $f --index $salindex -g $salindex/tx2gene -p 8 -o salmon/`basename $f .fastq.gz`
done
