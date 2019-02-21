Rails.application.routes.draw do

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #devise_for :users

   devise_for :users, controllers: {
        :sessions => "users/sessions",
        :registrations => "users/registrations",
        :passwords => "users/passwords",
        :confirmations => "users/confirmations",
        :unlocks => "users/unlocks"
        #omniauth_callbacks: 'users/omniauth_callbacks'
   }

 
  devise_scope :user do
    # get '/users/profil' => 'users/sessions#show'
    get '/users/profile/:id', to: 'users/sessions#show', as: :show_user_profile
    get '/users/list' => 'users/sessions#index'
    get '/users/edit/:id' => 'users/registrations#custom_edit', as: :custom_edit_user_registration
    patch '/users/update/:id' => 'users/registrations#custom_update', as: :custom_update_user_registration
    get '/users/newuser' => 'users/registrations#new_user', as: :custom_user_registration
    post '/users/saveuser' => 'users/registrations#create_user', as: :custom_create_user_registration
  end

  #resources :users 
  resources :activities
  resources :user_activities do 
    get 'delete' #this will allow to call the delete via popup modal
  end
  resources :roles 
  
  get 'user_activities/:id', to: 'user_activities#showview', as: :view_user_activity

  get 'dash' => 'homes#dashboard'

  get 'landhere' => 'welcomes#landingpage'
  root 'welcomes#landingpage'
end
