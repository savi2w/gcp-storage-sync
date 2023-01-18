FROM google/cloud-sdk:alpine

LABEL "com.github.actions.name"="GCP Storage Sync"
LABEL "com.github.actions.description"="Sync a directory to an GCP Storage repository"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="blue"

LABEL version="1.0.6"
LABEL repository="https://github.com/omppye-tech/gcp-storage-sync"
LABEL homepage="https://omppye.dev/"
LABEL maintainer="Devalue Human Life Corporation <omppye@gmail.com>"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
