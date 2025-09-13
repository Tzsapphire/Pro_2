#!/bin/bash

#creating a raw folder
mkdir raw 
mkdir transformed
mkdir gold

#define folder variables
RAW="raw"
#RAW="$(mkdir raw)"
TRANSFORMED="transformed"
GOLD="gold"

#link to url file
URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

#dowloading the file from the link, and save as the origin file name '-O'
curl  -O --output-dir "./$RAW" "$URL"
#curl "$URL" -O ./$RAW
#curl "$URL" -O ./raw/ 
echo "saving file into $RAW folder"

#changing the column_name , '-i' to edit files in place and save to the raw directory
sed -i 's/Variable_code/variable_code/g' "$(pwd)"/$RAW/*.csv 

#need to put some 'if' controls to be sure file exists

# selecting specific table columns; storoing in the transformed folder and renaming the file
awk -F"," '{print $1, $5, $6, $9}' "$(pwd)/$RAW"/*.csv > $TRANSFORMED/2023_year_finance.csv

#need to put some 'if' controls to catch the files before echo
echo "loaded into $TRANSFORMED folder"

# copy folder to gold load the directory into gold
cp "$(pwd)/transformed/2023_year_finance.csv" "$(pwd)/gold/"

#need to put some 'if' controls to catch the files before echo
echo "loaded into $GOLD folder"


#cron job to run daily
CRON_FILE="~/CDE/project_2/individual/Pro_2/scripts/bash_scripts/etl_schedule.sh"

# schedule job to run daily
crontab -e
0 00 * * * $CRON_FILE > ./error.log 2>&1

