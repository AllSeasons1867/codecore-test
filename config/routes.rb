Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :admin do 
    resources :dashboard, only: [:index]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:index, :new, :create]

  resources :questions do 
    resources :answers, only: [:create, :destroy]
  end

  # get "/questions/new", to: "questions#new", as: :new_question
  # post "/questions", to: "questions#create", as: :questions
  # get "/questions/:id", to: "questions#show", as: :question 
  # get "/questions", to: "questions#index"
  # get "/questions/:id/edit", to: "questions#edit", as: :edit_question
  # patch "/questions/:id", to: "questions#update"
  # put "/questions/:id", to: "questions#update"
  # delete "/questions/:id", to: "questions#destroy"

  get('/',{to:'welcome#index',as:'home'})

  get('/contact',{to:'contact#index'})  
  get('/contact_submit',{to:'contact#create'})
end

