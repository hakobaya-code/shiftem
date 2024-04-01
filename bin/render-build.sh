#!/usr/bin/env bash
# exit on error
set -o errexit
bundle install
npm install
export RAILS_ENV=production
bundle exec rails db:migrate
bundle exec rails assets:clean
bundle exec rails assets:precompile