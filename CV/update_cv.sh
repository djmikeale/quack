#! /bin/bash

# get all tables in specific schema TODO GREP all {{keyword}} instances in template file to FILES variable
FILES="jobs skills education"
#read content of template into variable
TEMPLATE=$(<CV_template.md)

#create temp template file if not exists
#copy content from template into temp template

#Destination file with placeholders filled out
DESTINATION="CV.md"

# export data and convert to .md format
for FILE in $FILES
    do
        FOLDER_FILE=$(echo ../target/$FILE)

        # Convert sql table into markdown table

        # export table
        duckcli ../mikael.duckdb -e "COPY $FILE TO '$FOLDER_FILE.csv' ( DELIMITER '|', HEADER )"
        # get first line of file
        FIRSTLINE=$(head -n 1 $FOLDER_FILE.csv)
        # replace all non-pipe "|" strings with "---"
        SECONDLINE=$(echo "$FIRSTLINE" | sed -E 's/[^|]+/---/g')
        # insert string on second line, save as new .md file
        awk -v secondline="$SECONDLINE" 'NR==2{print secondline}1' $FOLDER_FILE.csv > $FOLDER_FILE.md

        # Replace placeholders in template with markdown tables

        # read content of md file into SOURCE variable
        SOURCE=$(<$FOLDER_FILE.md)
        # replace placeholders in template TEMPLATE
        echo "${TEMPLATE//\{\{$FILE\}\}/$SOURCE}" > $DESTINATION
        # read updated template content into template variable in case of more loops.
        TEMPLATE=$(<$DESTINATION)

done
