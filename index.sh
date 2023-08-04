#!/bin/bash

# Elasticsearch server URL
ELASTICSEARCH_URL="http://localhost:9200"

# Index settings in JSON format
index_settings='
{
  "mappings": {
    "properties": {
      "boiko_field": {
        "type": "text",
        "analyzer": "boiko_analyzer",
        "search_analyzer": "standard"
      }
    }
  },
  "settings": {
    "analysis": {
      "filter": {
        "boiko_filter": {
          "type": "ngram",
          "min_gram": 3,
          "max_gram": 4
        }
      },
      "analyzer": {
        "boiko_analyzer": {
          "type": "custom",
          "tokenizer": "standard",
          "filter": ["boiko_filter"]
        }
      }
    }
  }
}
'

# Index name
INDEX_NAME="football-teams"

# Use curl to create the index
curl -XPUT "$ELASTICSEARCH_URL/$INDEX_NAME" -H "Content-Type: application/json" -d "$index_settings"
