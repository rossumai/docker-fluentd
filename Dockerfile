FROM bitnami/fluentd:1.13.3-debian-10-r17

USER root

RUN apt-get update && apt-get install -y gcc make \
    && rm -rf /var/lib/apt/lists/*

## Install custom Fluentd plugins

RUN fluent-gem install 'fluent-plugin-dedot_filter' \
    && fluent-gem install 'fluent-plugin-label-router' \
    && fluent-gem install 'fluent-plugin-elasticsearch' \
    && fluent-gem install 'fluent-plugin-record-modifier' \
    && fluent-gem install 'fluent-plugin-filter_empty_keys' \
    && fluent-gem install 'fluent-plugin-s3' \
    && fluent-gem install 'fluent-plugin-prometheus' \
    && fluent-gem install 'fluent-plugin-azurestorage'

USER 1001
