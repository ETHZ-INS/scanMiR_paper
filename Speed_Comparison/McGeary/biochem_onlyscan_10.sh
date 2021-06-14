#!/bin/bash


wd=/mnt/schratt/scanMiR_paper_scripts/Speed_Comparison/McGeary/
srcd=../../Parameter_Optimization/Run_Bartel_Scripts/miRNA_models-master/

cd $wd



# Guide Strands
mirs=`cat $wd/inputs/mirseqs_hek.txt | cut -f1 | sed 1d`
for mirname in $mirs; do \
python $srcd/get_features/write_sites.py \
--transcripts $wd/inputs/hek_transcripts_10.txt \
--mir "$mirname" \
--mirseqs $wd/inputs/mirseqs_hek.txt \
--kds $wd/outputs/kds/"$mirname"_kds.txt \
--sa_bg $wd/outputs/SA_background/bg_vals_processed/canon_"$mirname"_bg_vals.txt \
--rnaplfold_dir $wd/rnaplfold_orf_utr3_hek_10 \
--overlap_dist 12 \
--upstream_limit 15 \
--outfile $wd/outputs/scan10/"$mirname".txt ; \
done



