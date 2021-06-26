#!/bin/bash
echo "===== start entrypoint.sh ====="

set -e
rm -rf tmp/pids/server.pid

bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rails assets:precompile

exec "$@"
