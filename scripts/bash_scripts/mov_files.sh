#initialise bash 

#!/bin/bash

#define the folder location (from folder & to folder)
FROM_FOLDER="~/CDE/project_2/individual/Pro_2/bash_assi"
TO_FOLDER="~/CDE/project_2/individual/Pro_2/scripts/movd_files"

#move files to the new folder (could be wrong)
 cp "$FROM_FOLDER"/*.csv "$FROM_FOLDER"/*.json "$TO_FOLDER"

# cp "$(pwd)"/*.csv "$(pwd)"/*.json "$(pwd)/path_folder"

