FROM fluent/fluentd:v1.9.1-1.0
USER root
RUN gem install fluent-plugin-s3 -v 1.6.0 --no-document
USER fluent

ADD fluent.conf /fluentd/etc/
