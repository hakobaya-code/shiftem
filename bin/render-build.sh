#!/usr/bin/env bash
# exit on error
set -o errexit
bundle install
RAILS_ENV=production rails db:seed
bundle exec rails assets:clean
bundle exec rails assets:precompile
bundle exec rails db:migrate
bundle exec rails db:seed