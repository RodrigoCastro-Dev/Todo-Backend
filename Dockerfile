# Use the official Ruby image
FROM ruby:3.3.5

# Set environment variables
ENV RAILS_ENV=production \
  RAILS_LOG_TO_STDOUT=true \
  RAILS_SERVE_STATIC_FILES=true \
  NODE_ENV=production

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  npm

# Set working directory
WORKDIR /app

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

# Copy the rest of the application
COPY . .

# Precompile assets and migrate the database
RUN bundle exec rake db:migrate

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
