#!/bin/bash

curl -XPOST "http://localhost:9200/football-teams/_bulk" -H "Content-Type: application/json" -d '
{ "index": { "_index": "football-teams", "_id": "7" } }
{ "boiko_field": "juventus" }
{ "index": { "_index": "football-teams", "_id": "2" } }
{ "boiko_field": "barcelona" }
{ "index": { "_index": "football-teams", "_id": "3" } }
{ "boiko_field": "real-madrid" }
{ "index": { "_index": "football-teams", "_id": "4" } }
{ "boiko_field": "dynamo" }
{ "index": { "_index": "football-teams", "_id": "5" } }
{ "boiko_field": "metalist" }
'
