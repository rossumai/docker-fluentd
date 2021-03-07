FROM bitnami/fluentd:1.12.1-debian-10-r15

## Install custom Fluentd plugins
RUN fluent-gem install 'fluent-plugin-dedot_filter' \
    && fluent-gem install 'fluent-plugin-label-router' \
    && fluent-gem install 'fluent-plugin-elasticsearch' \
    && fluent-gem install 'fluent-plugin-record-modifier' \
    && fluent-gem install 'fluent-plugin-filter_empty_keys' \
    && fluent-gem install 'fluent-plugin-s3'
