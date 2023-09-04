ARG ES_VERSION=8.9.1
FROM elasticsearch:$ES_VERSION

RUN bin/elasticsearch-plugin install analysis-icu && \
    bin/elasticsearch-plugin install analysis-kuromoji