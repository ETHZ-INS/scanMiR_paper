#conda activate python27

wd=/mnt/schratt/scanMiR_paper_scripts/Speed_Comparison/Targetscan/
srcd=/mnt/schratt/scanMiR_paper_scripts/Targetscan_Corr/Run_Targetscan/Targetscan
cd $wd

# Run Calculate_Bins
python $srcd/calculate_bins/calculate_bins.py \
--utr3_file $wd/Input/HEK_UTR_Seqs_df_100.csv \
--tree_file $srcd/PCT_parameters/Tree.generic.txt \
--out $wd/Output/HEK_bin_out_100.csv \
--ref_species='9606' \
--futures = True


# Find Sites
python $srcd/find_sites/find_sites.py \
--seed_file $wd/Input/MiRs_HEK_seeds.csv \
--bin_file $wd/Output/HEK_bin_out_100.csv \
--utr3_file $wd/Input/HEK_UTR_Seqs_df_100.csv \
--tree_path $srcd/PCT_parameters/ \
--out $wd/Output/HEK_sites_out_100.csv \
--ribosome_shadow=14 \
--ref_species='9606' \
--futures = True


# Calculate Features
python $srcd/calculate_features/calculate_features.py \
--mirna_file $wd/Input/MiRs_file_HEK.csv \
--site_file $wd/Output/HEK_sites_out_100.csv \
--ta_sps_file $srcd/calculate_features/TA_SPS_by_seed_region.txt \
--orf_file $wd/Input/HEK_ORF_Seqs_df_100.csv \
--rnaplfold_temp $srcd/Temp/ \
--out $wd/Output/HEK_features_out_100.csv \
--ref_species='9606' \
--futures = True










