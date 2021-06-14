#!/bin/bash


wd=/mnt/schratt/scanMiR_paper_scripts/Speed_Comparison/McGeary/
cd $wd

timefull10=`(time ./biochem_full_10.sh) 2>&1 | grep real`
timefull100=`(time ./biochem_full_100.sh) 2>&1 | grep real`
timefull1000=`(time ./biochem_full_1000.sh) 2>&1 | grep real`

echo "$timefull10" > $wd/McGeary_times.txt
echo "$timefull100" >> $wd/McGeary_times.txt
echo "$timefull1000" >> $wd/McGeary_times.txt

timeonlyscan10=`(time ./biochem_onlyscan_10.sh) 2>&1 | grep real`
timeonlyscan100=`(time ./biochem_onlyscan_100.sh) 2>&1 | grep real`
timeonlyscan1000=`(time ./biochem_onlyscan_1000.sh) 2>&1 | grep real`

echo "$timeonlyscan10" >> $wd/McGeary_times.txt
echo "$timeonlyscan100" >> $wd/McGeary_times.txt
echo "$timeonlyscan1000" >> $wd/McGeary_times.txt





