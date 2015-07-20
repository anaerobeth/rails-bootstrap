Rails.application.routes.draw do
  root to: 'visitors#index'
  get '/pages' => 'pages#index'
end
