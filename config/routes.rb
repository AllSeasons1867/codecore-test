Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/questions/new", to: "questions#new", as: :new_question

  get('/',{to:'welcome#index',as:'home'})

  get('/contact',{to:'contact#index'})  
  get('/contact_submit',{to:'contact#create'})
end
