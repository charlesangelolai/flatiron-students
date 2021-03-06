# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users,
  :controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  },
  :path_names => {
    :sign_in => 'login',
    :sign_out => 'logout',
    :sign_up => 'signup'
  }

  devise_scope :user do
    authenticated :user do
      root 'dashboard#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :cohorts
  resources :surveys
  resources :survey_responses
  resources :survey_questions
  
  resources :projects, except: [:show]
  resources :projects, only: [:show] do
    resource :survey_responses
  end

  resources :categories
  resources :categories, only: [:show] do
    resources :posts do
      resources :comments
    end
  end

  get '/dashboard', to: 'dashboard#index'
end
