#! /bin/bash

# dbt run
# create new folder if not exists, empty folder if exists

# get all tables in specific schema
FILES="customers orders jobs"
#File to be used as template containing placeholders
TEMPLATE=$(<template)

#create temp template file if not exists
#copy content from template into temp template

#Destination file with placeholders filled out
DESTINATION="insertinto"

# export data and convert to .md format
for FILE in $FILES
    do
        FOLDER_FILE=$(echo target/$FILE)
        # export table 
        duckcli mikael.duckdb -e "COPY $FILE TO '$FOLDER_FILE.csv' ( DELIMITER '|', HEADER )"
        # get first line of file
        FIRSTLINE=$(head -n 1 $FOLDER_FILE.csv)
        # replace all non-pipe "|" strings with "---"
        SECONDLINE=$(echo "$FIRSTLINE" | sed -E 's/[^|]+/---/g')
        # insert string on second line, save as new .md file
        awk -v secondline="$SECONDLINE" 'NR==2{print secondline}1' $FOLDER_FILE.csv > $FOLDER_FILE.md
        # set file as source
        SOURCE=$(<$FOLDER_FILE.md)
        # replace placeholders in temp template  
        echo "${TEMPLATE//\{\{$FILE\}\}/$SOURCE}" > $DESTINATION
done

# replace content in destination file with content from temp template.

