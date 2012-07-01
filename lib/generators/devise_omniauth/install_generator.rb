module DeviseOmniauth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates a Devise initializer and copy locale files to your application."
      class_option :orm

      # TODO is there a way for these to come from devise even with the changes?
      def copy_views
        directory 'views/devise/', 'app/views/devise'
      end

      # TODO the source should come from devise and not duplicated in this gem
      def copy_initializer
        template "config/initializers/devise.rb", "config/initializers/devise.rb"
      end

      # TODO the source should come from devise and not duplicated in this gem
      def copy_locale
        copy_file "config/locales/en.yml", "config/locales/devise.en.yml"
      end

      # TODO should be able to customize the :as option (also will have to change in views)
      def add_devise_routes
        devise_route = "mount DeviseOmniauth::Engine => '/', :as => 'devise_omniauth'"
        route devise_route
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end