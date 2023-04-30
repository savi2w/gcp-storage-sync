#!/bin/sh

set -e

if [ -z "$GCP_STORAGE_BUCKET" ]; then
  echo "GCP_STORAGE_BUCKET is not set. Quitting."
  exit 1
fi

if [ -z "$GCP_SERVICE_ACCOUNT_KEY_FILE" ]; then
  echo "GCP_SERVICE_ACCOUNT_KEY_FILE is not set. Quitting."
  exit 1
fi

echo $GCP_SERVICE_ACCOUNT_KEY_FILE > json_file.json
gcloud auth activate-service-account --key-file json_file.json

sh -c "gsutil -m rsync $* -r ${SOURCE_DIR} gs://${GCP_STORAGE_BUCKET}/${DEST_DIR}"

gcloud auth revoke --all
shred -zvu -n 5 json_file.json
