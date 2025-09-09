#initialise bash 

#!/bin/bash

#define the folder location (from folder : to folder)
FROM_FOLDER=""
TO_FOLDER=""

#move files to the new folder (could be wrong)
 cp "$(pwd)"/*.csv "$(pwd)"/*.json "$(pwd)/path_folder"