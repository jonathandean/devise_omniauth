$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise_omniauth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise_omniauth"
  s.version     = DeviseOmniauth::VERSION
  s.authors     = ["Jonathan Dean"]
  s.email       = ["jon@jonathandean.com"]
  s.homepage    = "http://jonathandean.com"
  s.summary     = "Reusable Omniauth integration for Devise supporting multiple providers"
  s.description = "Reusable Omniauth integration for Devise supporting multiple providers. Essentially takes the how-to setup in the devise wiki for facebook and other providers and gives you code in your application to get started with."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency 'devise', "~> 2.1.2"
  s.add_dependency 'omniauth-facebook', "~> 1.4.0"

  s.add_development_dependency "pg"
end
