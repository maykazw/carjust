# README

CarsJust API service
You can use docker / docker-composer to init api
```
docker-compose build
docker-compose run web rake db:create db:seed
docker-compose up
```
To run test rspec : 

```docker-compose run web bundle exec rspec``` 
