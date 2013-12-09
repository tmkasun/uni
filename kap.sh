#!/bin/bash
bundle install
rake db:migrate RAILS_ENV=production
rake assets:clean RAILS_ENV=production
rm -R public/assets/
rake assets:precompile RAILS_ENV=production
sudo service apache2 restart
touch tmp/restart.txt

