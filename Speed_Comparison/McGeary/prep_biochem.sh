#!/bin/bash


wd=./
srcd=../../Parameter_Optimization/Run_Bartel_Scripts/miRNA_models-master/

cd $wd

#CNN
python $srcd/cnn/generate_12mer_kds.py \
--name all \
--mirdata $wd/inputs/mirseqs_hek.txt \
--mirlen 10 \
--load_model $srcd/cnn/trained_model/model-100 \
--outfile $wd/outputs/kds/MIR_kds.txt


# SA Background
python $srcd/rnaplfold/partition_seqs.py \
--mirseqs $wd/inputs/mirseqs_hek.txt \
--nbins 10 \
--outdir $wd/outputs/SA_background/sequences \
--only_canon

## For the Helas
mirs=`cat $wd/inputs/mirseqs_hek.txt | cut -f1 | sed 1d`
for mirname in $mirs; do \
for ix in 0 1 2 3 4 5 6 7 8 9 ; do \
#bsub -R "rusage[mem=4096]" \
python $srcd/rnaplfold/get_SA_bg.py \
--sequence_file $wd/outputs/SA_background/sequences/canon_"$mirname"_"$ix".txt \
--temp_folder $wd/outputs/SA_background/bg_vals/canon_"$mirname"_"$ix"_TEMP \
--num_bg 200 \
--num_processes 24 \
--outfile $wd/outputs/SA_background/bg_vals/canon_"$mirname"_"$ix"_bg_vals.txt; \
done; \
done


python $srcd/rnaplfold/combine_results.py \
--mirseqs $wd/inputs/mirseqs_hek.txt \
--nbins 10 \
--num_bg 200 \
--infile_seqs $wd/outputs/SA_background/sequences/canon_MIR_IX.txt \
--infile_bg $wd/outputs/SA_background/bg_vals/canon_MIR_IX_bg_vals.txt \
--outfile $wd/outputs/SA_background/bg_vals_processed/canon_MIR_bg_vals.txt 


