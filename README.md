# End to end verifiable e-voting for remote voting in the UK

## Clone the repository
```
git clone https://github.com/nharikrishnan22/End-to-end-verifiable-e-voting-for-remote-voting-in-the-UK.git
cd End-to-end-verifiable-e-voting-for-remote-voting-in-the-UK
```

## Check your Ruby version
```
ruby -v
```
This project uses Ruby 2.7.

## Install Dependencies
### SQLite3
Example installation instructions for Ubuntu:
```
sudo apt install sqlite3
```
### Node.js
### [Yarn](https://classic.yarnpkg.com/en/)
Example installation instructions for Debian/Ubuntu:
```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
```
### Rails
Example installation instructions for Ubuntu:
```
sudo apt install ruby-railties
```
### Bundler
Use bundler to install Ruby gems. Install bundler:
```
gem install bundler
```
Install gems from Gemfile:
```
bundle install
```
You may need to edit the version of Ruby in your Gemfile. Execute soemthing like:
```
nano Gemfile
```
### Drop database, load schema and seed the data from db/seeds.rb: see this [link](https://dev.to/neshaz/how-to-use-rake-db-commands-in-the-correct-way--50o2)
```
rake db:reset
```