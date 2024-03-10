# config/routes.rb
Rails.application.routes.draw do
  resources :locations # , only: [:index, :show]
  # other routes...
end