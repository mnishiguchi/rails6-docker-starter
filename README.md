# Rails 6 Docker Starter

## Get started

### Create rails application

Run

```sh
cd path/to/this/project

docker-compose run \
  --no-deps \
  web \
  rails new . \
    --force \
    --database=postgresql \
    --skip-sprockets \
    --skip-coffee \
    --webpack
```

### Configure Database

In `config/database.yml`, change the contents to something like:

```yml
default: &default
  adapter:  postgresql
  encoding: unicode
  database: <%= ENV.fetch('POSTGRES_DB') %>
  username: <%= ENV.fetch('POSTGRES_USER') %>
  password: <%= ENV.fetch('POSTGRES_PASSWORD') %>
  host:     <%= ENV.fetch('DATABASE_HOST') %>
  pool:     <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default

test:
  <<: *default
  database: railsapp_test

production:
  <<: *default
```

### Configure Webpacker

- We need to point our webpacker config at our running `webpacker` service.

In `config/webpacker.yml`

- change `host: localhost` to `host: webpacker`
- change `public: localhost:3035` to `public: webpacker:3035`

### Change other configs (optional)

- generator config
- Gemfile
- etc

### Start the application

Run

```sh
docker-compose up
```

### Create database

```sh
docker-compose exec web \
  bin/rails db:create db:migrate
```

### Visit application

In your browser, go to http://localhost:3000.

### Install webpacker and and react

- https://github.com/reactjs/react-rails#get-started-with-webpacker

### Run tests

#### Unit test

```sh
docker-compose exec web \
  bin/rails test
```

#### Log

```sh
docker-compose exec web \
  tail -f log/test.log
```

#### System tests

The `selenium/standalone-chrome-debug` image includes a running VNC server,
which allows us to connect and actually view tests as they run in the browser.

On Mac, open the Screen Sharing app and connect to `vnc://localhost:5900`.

```sh
docker-compose exec web \
  bin/rails test:system
```

### After updating Gemfile

```sh
docker-compose exec web bundle
```

### After updating Docker file

```sh
docker-compose stop web
docker-compose build web
docker-compose up -d --force-recreate web
```

### After updating docker-compose

```sh
docker-compose stop web
docker-compose up -d --force-recreate web
```

## Debugging

Add a breakpoint to a ruby file with `byebug` or `binding.pry`.

```sh
docker-compose stop web

# The --service-ports option ensures that our Rails server will be accessible on
# port 3000 from the browser.
docker-compose run --service-ports web
```

## Links

- [zacharyw/rails-5-docker-webpacker-quickstart](https://github.com/zacharyw/rails-5-docker-webpacker-quickstart)
- [Docker for Rails Developers](https://pragprog.com/book/ridocker/docker-for-rails-developers)
