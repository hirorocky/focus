# installation
docker build -t focus_image .

docker run -it -v C:/dev/rails/focus/src:/src --name focus -p 8080:3000 focus_image bash

docker exec -it focus bash

# push to heroku
## remind
- bundle install

## execute deploying
git subtree push --prefix src/ heroku master  
heroku run rails db:migrate
