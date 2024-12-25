set -e
name="open-logic-3.2.0-dev"
location="development-cores/$name"
rm -rf $location
fusesoc library add $name git@github.com:rbrglez/open-logic.git --location $location

cd $location
git checkout test/3.2.0-dev