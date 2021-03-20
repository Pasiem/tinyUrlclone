Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  get '', to: 'home#index'
  get 'index', to: 'tinyurls#index'
  get ':id', to: 'tinyurls#show'
  get ':id/info', to: 'tinyurls#info'

  resources :tinyurls

end
