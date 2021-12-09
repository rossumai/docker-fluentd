FROM bitnami/fluentd:1.14.3-debian-10-r11

USER root

# Compiler for fluent-plugin-azure-storage-append-blob-lts
RUN apt-get update && apt-get install -y gcc make \
    && rm -rf /var/lib/apt/lists/*

# Install custom Fluentd plugins
RUN fluent-gem install 'fluent-plugin-dedot_filter' \
    && fluent-gem install 'fluent-plugin-label-router' \
    && fluent-gem install 'fluent-plugin-record-modifier' \
    && fluent-gem install 'fluent-plugin-filter_empty_keys' \
    && fluent-gem install 'fluent-plugin-azure-storage-append-blob-lts'

USER 1001
