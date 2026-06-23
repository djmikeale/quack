deleted file in other repo, moved here for now:

# cv

## source files
- job positions
- education

## process

### dbt
1. read from csv's
2. transform
3. create "views"


1. export views as csv
6. [csv to markdown](https://www.npmjs.com/package/csv-to-markdown), alternatively find out how to read occurences of | characters on first line, and generate |---|---| pattern on second line
7. [iterate over all markdown files in folder](https://fedingo.com/shell-script-to-loop-through-files-in-a-directory/) ...[alternative](https://unix.stackexchange.com/questions/162586/proper-way-to-iterate-through-contents-in-a-directory)
8. [replace string with content of file](https://stackoverflow.com/questions/31776711/replace-string-in-one-file-with-contents-of-another-file)
9. iterative find-replace for all <table_name> occurences, to insert text from .md table files into overall md file, and append it to README.md 
