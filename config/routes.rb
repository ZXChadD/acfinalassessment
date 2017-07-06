Rails.application.routes.draw do
  devise_for :users#, controllers: { sessions: 'users/sessions' }


  resources :users
  resources :notes do
    member do
      post 'like'
      delete 'unlike'
    end
  end

  resources :relationships, only: [:create, :destroy]
  get 'homepage', to: 'users#homepage', as: :homepage
  get 'alluser', to: 'users#alluser', as: :alluser
  get 'Favourites', to: 'users#favourite', as: :favourite



  root 'users#homepage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
