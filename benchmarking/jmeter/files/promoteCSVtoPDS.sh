#!/bin/bash

# Authenticate and extract the token
TOKEN=$(curl -X POST  http://dremio-client.dremio:9047/apiv2/login -H 'Content-Type: application/json'   -d '{"userName": "dremio", "password": "dremio_datalake_poc0"}'| jq -r '.token' )

# Iterate through datasets
for i in `cat tables_list.txt`
do

   DATAOUTPUT=$(curl -X PUT  http://dremio-client.dremio:9047/apiv2/source/datalake/folder_format/100g/$i.csv -H 'Authorization: _dremio'"$TOKEN"''  -H 'Content-Type: application/json'  -d '{"type": "Text", "fieldDelimiter": "|", "skipFirstLine": false, "extractHeader": true, "quote": "\"", "comment": "#", "escape": "\"", "lineDelimiter": "\n", "autoGenerateColumnNames": true, "trimHeader": true}');

   echo $DATAOUTPUT;
done
