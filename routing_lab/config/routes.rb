RoutingLab::Application.routes.draw do
    
  root to: 'home#start'
  get 'a/', to: 'home#a'
  get 'b/', to: 'home#b'
  get '/1', to: 'home#one'
  get '/2', to: 'home#two'
  get '/3', to: 'home#three'
  get '/door', to: 'home#door'
end
