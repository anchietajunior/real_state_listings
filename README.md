# Real State Listings

Simple Rails application to fetch Real State info.

- [x] Ruby 3.1.1
- [x] Rails 7.0.0
- [x] Hotwire with ESbuild
- [x] Stimulus
- [x] RSpec
- [x] Shoulda Matchers
- [x] Database Cleaner
- [x] FactoryBot
- [x] VCR
- [x] Pagy
- [x] Interactor

## The Service Layer

To build the service responsible for importing the data i used the Interactor Gem. This Gem
provide us Interactors (classes to build specific things) and Organizers, classes that call other
classes. You can thing the organizer and the interactors inside this folder:

```
app/services/real_states
```

The interactor pattern is a good choice for testing and organizing business logic.

## Setup the application

For this application i used a hybrid environment using Docker for the Postgres
and my local environment for the Rails application.

### Setup PostgreSQL using Docker

```shell
docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres
```

### Install dependencies and setup database

```shell
bundle install

rails db:create && rails db:migrate
```

## Data normalization

Instead of using a field called city, I created a table called city and I always search this table by the name of the city, so we save on the size of the main table and normalize the data.

## Importing data from a csv File

The import process uses a task called import_from_csv, this task accepts an argument, the url to the file.

Example:

```shell
rails import_from_csv https://transport.productsup.io/f3a2e50f7147b3825f50/channel/340023/pdsfeed.csv
```

## Test Coverage

Using the SimpleCov gem for this application.

![Screen Shot 2022-10-10 at 13 37 21](https://user-images.githubusercontent.com/8007754/194916624-0f367861-1efa-43d9-8f51-f9834e8efebb.png)


## Results in a view using Hotwire (turbo frame) and Stimulus.

This page is just to show how we can handle views using the Hotwire and Stimulus way in Rails
without a lot of Javascripts in our front-end applications.

![Screen Shot 2022-10-10 at 13 37 35](https://user-images.githubusercontent.com/8007754/194916646-664f2ba4-6294-4a37-ae75-477285b679a1.png)
