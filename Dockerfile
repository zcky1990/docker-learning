# syntax=docker/dockerfile:1
FROM ruby:3.0.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /dokerize-rails
COPY Gemfile /dokerize-rails/Gemfile
COPY Gemfile.lock /dokerize-rails/Gemfile.lock
COPY . /dokerize-rails
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0", "--host 172.18.0.1"]
