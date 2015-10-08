#!/bin/bash
cd /app && bundle exec rake db:create RAILS_ENV=production
cd /app && bundle exec ridgepole -E production -c config/database.yml --apply
cd /app && bundle exec unicorn -E production -c /app/config/unicorn.rb
