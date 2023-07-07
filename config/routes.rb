Rails.application.routes.draw do
  resources :candidates
  
  # get 'bmi/index' 改成下面那樣
  get 'bmi', to: 'bmi#index'
  post 'bmi/result', to: 'bmi#result'
  get 'bmi/show', to: 'bmi#show' # post 後 get show 顯示

  get 'hello_world', to: 'pages#hello'

  resources :posts
  resources :users
end
