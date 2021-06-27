#!/bin/bash
set -e

RAILS_ENV=production
export RAILS_ENV=$RAILS_ENV

RAILS_PORT=3000
export RAILS_PORT=$RAILS_PORT

echo "===== start ep.apprunner2.sh ====="
echo
echo "===== start rails ====="
echo
echo "===== RAILS_ENV: $RAILS_ENV / RAILS_PORT: $RAILS_PORT ====="

rm -rf tmp/pids/server.pid

echo "===== db migration ====="
# タイミングによっては同時に複数のマイグレーションが走る可能性があるので注意
bundle exec rake db:create
bundle exec rake db:migrate

echo "===== asset precompile ====="
bundle exec rails assets:precompile

echo "===== start puma ====="
bundle exec puma -C config/puma2.rb &

echo
echo "===== start nginx ====="
echo

/usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/app.conf
