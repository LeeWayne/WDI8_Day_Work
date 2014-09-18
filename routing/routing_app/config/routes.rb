RoutingApp::Application.routes.draw do
  root to: 'home#about_us'
  get '/about_us', to: 'home#about_us'
  get '/faqs', to: 'home#faqs'
  get '/terms', to: 'home#terms'
  
end