Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index, :show, :create, :update, :destroy]
    end
  end
  resources :candidates do
    member do 
      post :vote
    end
  end
  
  # get 'bmi/index' 改成下面那樣
  get 'bmi', to: 'bmi#index'
  post 'bmi/result', to: 'bmi#result'
  get 'bmi/show', to: 'bmi#show' # post 後 get show 顯示

  get 'hello_world', to: 'pages#hello'

  resources :posts
  resources :users
end
