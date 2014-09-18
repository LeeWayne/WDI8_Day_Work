MyBandapp::Application.routes.draw do
  
  root to: 'home#bandmembers'
  get '/bandmembers', to: 'home#bandmembers'
  get '/tourdates', to: 'home#tourdates'
  get '/images', to: 'home#images'
end
