set -e
name="open-logic-4.0.0"
location="development-cores/$name"
rm -rf $location
fusesoc library add $name git@github.com:rbrglez/open-logic.git --location $location

cd $location
git checkout test/4.0.0