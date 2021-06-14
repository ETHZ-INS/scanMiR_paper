#!/bin/bash


wd=./Parameter_Optimization/Run_McGeary_Scripts
srcd=./Parameter_Optimization/Run_McGeary_Scripts/miRNA_models-master

cd $wd

#CNN
python miRNA_models-master/cnn/generate_12mer_kds.py \
--name all \
--mirdata $wd/inputs/mirseqs_hela.txt \
--mirlen 10 \
--passenger \
--load_model miRNA_models-master/cnn/trained_model/model-100 \
--outfile $wd/outputs/kds/MIR_kds.txt


# SA Background
python miRNA_models-master/rnaplfold/partition_seqs.py \
--mirseqs $wd/inputs/mirseqs_hela.txt \
--nbins 10 \
--outdir $wd/outputs/SA_background/sequences \
--only_canon \
--passenger

## For the Helas
mirs=`cat $wd/inputs/mirseqs_hela.txt | cut -f1 | sed 1d`
for mirname in $mirs; do \
for ix in 0 1 2 3 4 5 6 7 8 9 ; do \
#bsub -R "rusage[mem=4096]" \
python miRNA_models-master/rnaplfold/get_SA_bg.py \
--sequence_file $wd/outputs/SA_background/sequences/canon_"$mirname"_"$ix".txt \
--temp_folder $wd/outputs/SA_background/bg_vals/canon_"$mirname"_"$ix"_TEMP \
--num_bg 200 \
--num_processes 24 \
--outfile $wd/outputs/SA_background/bg_vals/canon_"$mirname"_"$ix"_bg_vals.txt; \
done; \
done


python miRNA_models-master/rnaplfold/combine_results.py \
--mirseqs $wd/inputs/mirseqs_hela.txt \
--nbins 10 \
--num_bg 200 \
--infile_seqs $wd/outputs/SA_background/sequences/canon_MIR_IX.txt \
--infile_bg $wd/outputs/SA_background/bg_vals/canon_MIR_IX_bg_vals.txt \
--outfile $wd/outputs/SA_background/bg_vals_processed/canon_MIR_bg_vals.txt 
#--passenger


## RNAplfold

mkdir TEMP_hek
cd TEMP_hek
RNAplfold -L 40 -W 80 -u 15 < ../hek_orf_utr3_anB.fa
cd ..

mkdir rnaplfold_orf_utr3_hek_anB
python $srcd/rnaplfold/process_mRNA_folding.py \
--transcripts hek_transcripts_anB.txt \
--indir TEMP_hek \
--outdir rnaplfold_orf_utr3_hek_anB
rm -r TEMP_hek



mkdir TEMP_hela
cd TEMP_hela
RNAplfold -L 40 -W 80 -u 15 < ../hela_orf_utr3_anB.fa
cd ..



mkdir rnaplfold_orf_utr3_hela_anB
python $srcd/rnaplfold/process_mRNA_folding.py \
--transcripts hela_transcripts_anB.txt \
--indir TEMP_hela \
--outdir rnaplfold_orf_utr3_hela_anB
rm -r TEMP_hela


## For the Helas

# Guide Strands
mirs=`cat $wd/inputs/mirseqs_hela.txt | cut -f1 | sed 1d`
for mirname in $mirs; do \
python $srcd/get_features/write_sites.py \
--transcripts $wd/hela_transcripts_anB.txt \
--mir "$mirname" \
--mirseqs $wd/inputs/mirseqs_hela.txt \
--kds $wd/outputs/kds/"$mirname"_kds.txt \
--sa_bg $wd/outputs/SA_background/bg_vals_processed/canon_"$mirname"_bg_vals.txt \
--rnaplfold_dir $wd/rnaplfold_orf_utr3_hela_anB \
--overlap_dist 12 \
--upstream_limit 15 \
--outfile ../data/McGeary_2019_processed/HELA_Features_McGeary_Scan/"$mirname".txt ; \
done



# # Passenger Strands
# mirs=`cat $wd/inputs/mirseqs_hela.txt | cut -f1 | sed 1d`
# for mirname in $mirs; do \
# python $srcd/get_features/write_sites.py \
# --transcripts $wd/hela_transcripts_anB.txt \
# --mir "$mirname"_pass \
# --mirseqs $wd/inputs/mirseqs_hela.txt \
# --kds $wd/outputs/kds/"$mirname"_pass_kds.txt \
# #--sa_bg $srcd/sample_data/outputs/SA_background/bg_vals_processed/canon_"$mirname"_bg_vals.txt \
# --rnaplfold_dir $wd/outputs/rnaplfold/rnaplfold_orf_utr3/ \
# --overlap_dist 12 \
# --upstream_limit 15 \
# --outfile $wd/hela_features_anB/"$mirname"_pass.txt ; \
# done







# mirs=`cat $wd/inputs/mirseqs.txt | cut -f1 | sed 1d`
# for mirname in $mirs; do \
# python $srcd/biochem_model/predict.py \
# --features hek_features_anB/"$mirname".txt \
# --features_pass hek_features_anB/"$mirname"_pass.txt \
# --model $srcd/biochem_model/trained_models/biochemplus.json \
# --freeAGO -6.5 \
# --freeAGO_pass -7.5 \
# --outfile predictions_anB/"$mirname".txt; \
# done
