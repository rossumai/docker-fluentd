FROM bitnami/fluentd:1.14.3-debian-10-r12

USER root

# Compiler for fluent-plugin-azure-storage-append-blob-lts
RUN apt-get update && apt-get install -y gcc make \
    && rm -rf /var/lib/apt/lists/*

# Install custom Fluentd plugins
RUN fluent-gem install 'fluent-plugin-dedot_filter' -v 1.0.0 \
    && fluent-gem install 'fluent-plugin-label-router' -v 0.2.10 \
    && fluent-gem install 'fluent-plugin-record-modifier' -v 2.1.0 \
    && fluent-gem install 'fluent-plugin-filter_empty_keys' -v 0.0.4 \
    && fluent-gem install 'fluent-plugin-azure-storage-append-blob-lts' -v 0.6.3 \
    && fluent-gem install 'fluent-plugin-detect-exceptions' -v 0.0.14

# Fix read permissions for fluent-plugin-detect-exceptions plugin
RUN chmod oug+r /opt/bitnami/fluentd/gems/fluent-plugin-detect-exceptions-0.0.14/lib/fluent/plugin/*.rb

USER 1001
