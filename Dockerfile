FROM openjdk:8

LABEL version="1.1.0"
LABEL repository="https://github.com/w9jds/firebase-action"
LABEL homepage="https://github.com/w9jds/firebase-action"
LABEL maintainer="Jeremy Shore <w9jds@github.com>"

LABEL com.github.actions.name="GitHub Action for Firebase"
LABEL com.github.actions.description="Wraps the firebase-tools CLI to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

RUN apt update && \
  apt install -y nodejs npm
RUN npm install -g firebase-tools && \
  firebase setup:emulators:firestore

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
