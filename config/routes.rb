Rails.application.routes.draw do
  # get 'bmi/index' 改成下面那樣
  get 'bmi', to: 'bmi#index'
  post 'bmi/result', to: 'bmi#result' 
  get 'bmi/show', to: 'bmi#show' # post 後 get show 顯示

  get 'hello_world', to: 'pages#hello'

  resources :posts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
