Rails.application.routes.draw do
  root to: 'visitors#index'
  get '/pages/about'
end
