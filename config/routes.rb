Rails.application.routes.draw do
  # get 'bmi/index' 改成下面那樣
  get 'bmi', to: 'bmi#index'
  post 'bmi/result', to: 'bmi#result' # TODO: 打完這支api要把post的結果 撈出來 用GET? 參考user是create完到show顯示

  get 'hello_world', to: 'pages#hello'

  resources :posts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
