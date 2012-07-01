# This is an empty shell file just so that you can run the generators in your application without error.
# For this gem to work you must run "rails generate devise_omniauth:install" in your application. See the README for more info
Devise.setup do |config|
  require 'devise/orm/active_record'
end