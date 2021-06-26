#!/bin/bash
set -e

echo "===== start ep.apprunner.sh ====="
echo
echo "===== start rails ====="
echo

rm -rf tmp/pids/server.pid

echo "===== db migration ====="
# タイミングによっては同時に複数のマイグレーションが走る可能性があるので注意
bundle exec rake db:create
bundle exec rake db:migrate

echo "===== asset precompile ====="
bundle exec rails assets:precompile

echo "===== start puma ====="
bundle exec puma -C config/puma.rb &

echo
echo "===== start nginx ====="
echo

/usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/app.conf &

exec "$@"
