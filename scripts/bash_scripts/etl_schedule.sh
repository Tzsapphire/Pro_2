#!/bin/bash

#creating a raw folder
mkdir raw 
mkdir transformed
mkdir gold

#link to url file
URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

#dowloading the file from the link
curl "https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv" -O #"file_#1.txt"

#changing the column_name
sed -i 's/Variable_code/variable_code/g' full_path_filename


# add folder path
awk -F"," '{print $1, $5, $6, $9}' annual-enterprise-survey-2023-financial-year-provisional.csv > transformed/2023_year_finance.csv

# copy folder to gold load the directory into gold
# "cp transformed/2023_year_finance.csv gold/
cp "$(pwd)/transformed/2023_year_finance.csv" "$(pwd)/gold/"


#schedule job to run daily
crontab -e
0 00 * * * path_to_file