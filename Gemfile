# Look for ruby gems here
source 'https://rubygems.org'

# Set required ruby version (for heroku)
ruby '2.2.3'

gem 'rails', '4.2.4'

# Reduce rails kitchen sink approach
gem 'rails-api'

# Cross-Origin Resource Sharing
gem 'rack-cors', require: 'rack/cors'

# Use PostgreSQL database
gem 'pg'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Help with JSON serialization
gem 'active_model_serializers'

# makes frontend better
gem 'handlebars', '~> 0.7.0'

# paperclip for uploading images
gem 'paperclip', '~> 4.3'

# asw gemfile for amazon storage
gem 'aws-sdk-v1'

# makes rails pay attention to .env

gem 'dotenv-rails', :groups => [:development, :test]


group :development do
  # Use pry over irb for rails console
  gem 'pry-rails'
  gem 'byebug'
end

  group :production do
     gem 'rails_12factor'
     gem 'puma'



end


