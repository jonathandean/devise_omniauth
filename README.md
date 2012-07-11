devise-omniauth
===============

This gem is very much in development and I do not at all recommend using it in a project yet. Feel free to contribute though :)

Reusable Omniauth integration for Devise supporting multiple providers. Gives you a User model

Run the installer

    rails generate devise_omniauth:install

Follow the instructions output from the installer

Install the database migrations

    rake devise_omniauth:install:migrations

Run migrations

    rake db:migrate





# Below are old notes, ignore
#Mount the engine's routes in your routes.rb. Note: if you change the :as option you will need to customize the paths in the devise views (see below)
#
#    mount DeviseOmniauth::Engine => "/", :as => "devise_omniauth"
#
#Now you can access the routes url helpers from this engine in your application using the prefix you cleared in the :as above, for instance:
#
#    devise_omniauth.user_omniauth_authorize_path(:facebook)
#
#Install the devise initializer
#
#    rails generate initializer devise
#
#Open the newly created config/initializers/devise.rb and customize the following lines with your oauth settings:
#
#    config.omniauth :facebook, "[SET APP_ID HERE]", "[SET APP_SECRET HERE]"
#
#To customize the devise views (optional):
#
#    rails generate devise:views
#
#
#
#
#
#For each provider you want to use, add them to your config/initializers/devise.rb, for instance:
#
#    require "omniauth-facebook"
#    config.omniauth :facebook, "APP_ID", "APP_SECRET"
#
#Make sure your model is omniauthable (app/models/user.rb
#
#    devise :omniauthable