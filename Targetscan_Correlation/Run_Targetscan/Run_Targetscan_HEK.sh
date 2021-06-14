#conda activate python27

cd /mnt/schratt/scanMiR_paper_scripts/Targetscan_Corr/Run_Targetscan/Targetscan

# Run Calculate_Bins
python calculate_bins/calculate_bins.py \
--utr3_file ../Input/HEK_UTR_Seqs_df.csv \
--tree_file PCT_parameters/Tree.generic.txt \
--out ../Output/HEK_bin_out.csv \
--ref_species='9606' \
--futures = True


# Find Sites
python find_sites/find_sites.py \
--seed_file ../Input/MiRs_con_seeds.csv \
--bin_file ../Output/HEK_bin_out.csv \
--utr3_file ../Input/HEK_UTR_Seqs_df.csv \
--tree_path PCT_parameters/ \
--out ../Output/HEK_sites_out.csv \
--ribosome_shadow=14 \
--ref_species='9606' \
--futures = True


# Calculate Features
python calculate_features/calculate_features.py \
--mirna_file ../Input/MiRs_file.csv \
--site_file ../Output/HEK_sites_out.csv \
--ta_sps_file calculate_features/TA_SPS_by_seed_region.txt \
--orf_file ../Input/HEK_ORF_Seqs_df.csv \
--rnaplfold_temp Temp/ \
--out ../Output/HEK_features_out.csv \
--ref_species='9606' \
--futures = True


# Calculate Predictions
python calculate_predictions/calculate_predictions.py \
--feature_file ../Output/HEK_features_out.csv \
--coeff_file calculate_predictions/Agarwal_2015_parameters.txt \
--out_dir ../Output/









