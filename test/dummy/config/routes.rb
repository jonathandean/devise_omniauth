Rails.application.routes.draw do

  mount DeviseOmniauth::Engine => "/devise_omniauth"
end
