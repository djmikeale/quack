#! /bin/bash

dbt run
# create new folder if not exists, empty folder if exists
# get all tables in specific schema

FILES="customers orders jobs"

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
done

# build functionality to replace specific things in overall CV with content from files being iterated over
