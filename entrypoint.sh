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

gsutil config -e <<-EOF > /dev/null 2>&1
${GCP_SERVICE_ACCOUNT_KEY_FILE}
text
EOF

sh -c "gsutil rsync $* -r ${SOURCE_DIR} gs://${GCP_STORAGE_BUCKET}/${DEST_DIR}"

gsutil config -e <<-EOF > /dev/null 2>&1
null
text
EOF
