# EXTRACT PHASE
# Extract .gz with wget 

echo "Extracting file..."

wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0250EN-SkillsNetwork/labs/Bash%20Scripting/ETL%20using%20shell%20scripting/web-server-access-log.txt.gz


# unzip the .gz file using gzip to extract the .txt file

gunzip -f web-server-access-log.txt.gz

# extract the timestamp, latitude, longitutde, and visitorid columns

cut -d"#" -f1,2,3,4 web-server-access-log.txt > extracted-web-server-data.txt

# TRANSFORM PHASE

echo "Tranforming the file!"

tr "#" "," < extracted-web-server-data.txt > transformed-web-server-data.csv

# LOAD PHASE
# Load command structure: COPY table_name FROM 'filename' DELIMITERS 'delimiter_character' FORMAT;

echo "Loading tranformed-web-server-data.csv into access_log table in template1 database in PostGreSQL"

echo "\c template1;\COPY access_log FROM '/home/project/transformed-web-server-data.csv' DELIMITERS ',' CSV HEADER;" | psql --username=postgres --host=localhost

echo "Veryfing access_log population"

echo '\c template1; \\SELECT * from access_log;' | psql --username=postgres --host=localhost






