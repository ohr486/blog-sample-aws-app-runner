#!/bin/bash
set -e

RAILS_ENV=production
export RAILS_ENV=$RAILS_ENV

echo "===== start ep.apprunner1.sh ====="
echo
echo "===== start rails ====="
echo
echo "===== RAILS_ENV: $RAILS_ENV ====="

rm -rf tmp/pids/server.pid

echo "===== db migration ====="
# タイミングによっては同時に複数のマイグレーションが走る可能性があるので注意
#RAILS_ENV=$RAILS_ENV bundle exec rake db:create
RAILS_ENV=$RAILS_ENV bundle exec rake db:migrate

echo "===== asset precompile ====="
RAILS_ENV=$RAILS_ENV bundle exec rails assets:precompile

echo "===== start puma ====="
RAILS_ENV=$RAILS_ENV bundle exec puma -C config/puma1.rb
