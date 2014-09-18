MusicApp::Application.routes.draw do
root to: 'musics#index'  

  resources :musics


end
