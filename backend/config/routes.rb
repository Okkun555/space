Rails.application.routes.draw do
  namespace :api do
    post "auth/sign_up", to: "auth/sign_up#create"
    post "auth/login", to: "auth/sessions#create"
    delete "auth/logout", to: "auth/sessions#destroy"
  end
end
