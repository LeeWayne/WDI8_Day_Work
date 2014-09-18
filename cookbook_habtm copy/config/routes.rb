CookbookOnRails::Application.routes.draw do
  resources :categories

  resources :ingredients

  resources :recipes

  root :to => 'recipes#index'
end
