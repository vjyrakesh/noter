Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  get 'forbidden' => 'admin#forbidden'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :users
  resources :categories
  resources :notes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'notes#index'
end
