#!/bin/bash
## Run on only your responsibilitity.## 

SKIP_POST_DEPLOYMENT_MIGRATIONS=true
export NODE_OPTIONS="--max-old-space-size=1024"


# Pull Mastodon 
cd ~/live   
git fetch upstream
git checkout main
git merge upstream/main

# Reget Yarnpkg pubkey
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg |  apt-key add -

# Update pkg(s) 
 apt update -y 
 apt upgrade -y 
cd ~/.rbenv/plugins/ruby-build && git pull 
printf N | rbenv install $(cat ~/live/.ruby-version)
rbenv global $(cat ~/live/.ruby-version)
cd ~/live
gem update --system
gem install bundler
bundle update
bundle install 
 yarn install 


# Migrate  
RAILS_ENV=production bundle exec rails assets:clobber 
RAILS_ENV=production bundle exec rails db:migrate 
RAILS_ENV=production bundle exec rails assets:precompile 
 systemctl restart mastodon-*.service
RAILS_ENV=production ~/live/bin/tootctl cache clear

# Migrate again
RAILS_ENV=production bundle exec rails db:migrate 
 systemctl restart mastodon-*.service
