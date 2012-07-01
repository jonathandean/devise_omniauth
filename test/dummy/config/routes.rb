Rails.application.routes.draw do

  mount DeviseOmniauth::Engine => "/devise-omniauth"
end
