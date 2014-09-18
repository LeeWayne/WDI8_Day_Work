Carrierwave::Application.routes.draw do
  
  root to: "recipes#index"
  resources :recipes


 
end
