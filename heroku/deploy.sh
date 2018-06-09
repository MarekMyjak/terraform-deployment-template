heroku_git_url=$1
my_app_url=$2
my_app_name=$3
git clone my_app_url
cd my_app_name
git remote remove origin
git remote add origin heroku_git_url
git add --all
git commit -m "dev"
git push origin master