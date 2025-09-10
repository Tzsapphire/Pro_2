#initialise bash 

#!/bin/bash

#define the folder location (from folder & to folder)
#FROM_FOLDER="~/CDE/project_2/individual/Pro_2/bash_assi"
#TO_FOLDER="~/CDE/project_2/individual/Pro_2/scripts/movd_files"

FROM_FOLDER="./bash_assi"
TO_FOLDER="./movd_files"

mkdir -p "$TO_FOLDER"

#move files to the new folder (could be wrong)
 mv "$FROM_FOLDER"/*.csv "$FROM_FOLDER"/*.json "$TO_FOLDER"

#to copy files use
# cp "$(pwd)"/*.csv "$(pwd)"/*.json "$(pwd)/path_folder"

