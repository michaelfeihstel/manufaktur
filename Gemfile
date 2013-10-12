source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '~> 4.0.0'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'annotate', ">=2.5.0"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# HEROKU
gem 'pg'

group :production do
	gem 'rails_12factor'
end


# Gems used only for assets and not required
# in production environments by default.

# ASSETS
gem 'anjlab-bootstrap-rails',
	:require => 'bootstrap-rails',
	:github => 'anjlab/bootstrap-rails'
gem 'sass-rails',   '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier'

#
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'meta_search'

group :test, :development do
	gem "rspec-rails"
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
