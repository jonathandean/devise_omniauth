DeviseOmniauth::Engine.routes.draw do

  devise_for :users, {
    controllers: {:omniauth_callbacks => "devise_omniauth/users/omniauth_callbacks"}
  }

end
