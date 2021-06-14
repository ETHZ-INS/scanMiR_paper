#This has to be done manually in advance!
#conda activate python27

wd=/mnt/schratt/scanMiR_paper_scripts/Speed_Comparison/Targetscan/
srcd=/mnt/schratt/scanMiR_paper_scripts/Targetscan_Corr/Run_Targetscan/Targetscan
cd $wd


timeTar10=`(time ./Run_Targetscan_HEK_speed_10.sh) 2>&1 | grep real`
timeTar100=`(time ./Run_Targetscan_HEK_speed_100.sh) 2>&1 | grep real`
timeTar1000=`(time ./Run_Targetscan_HEK_speed_1000.sh) 2>&1 | grep real`

echo "$timeTar10" > $wd/Targetscan_times.txt
echo "$timeTar100" >> $wd/Targetscan_times.txt
echo "$timeTar1000" >> $wd/Targetscan_times.txt

timeTarMult10=`(time ./Run_Targetscan_HEK_speed_10_mult.sh) 2>&1 | grep real`
timeTarMult100=`(time ./Run_Targetscan_HEK_speed_100_mult.sh) 2>&1 | grep real`
timeTarMult1000=`(time ./Run_Targetscan_HEK_speed_1000_mult.sh) 2>&1 | grep real`

echo "$timeTarMult10" >> $wd/Targetscan_times.txt
echo "$timeTarMult100" >> $wd/Targetscan_times.txt
echo "$timeTarMult1000" >> $wd/Targetscan_times.txt





