Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create do
      resources :special_thanks, only: [:create, :destroy]
      resources :thanks, only: [:create, :destroy]
    end
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  resources :games, only: [:index, :new, :create, :show, :destroy] do
    resources :game_comments, only: [:index, :new, :create, :destroy]
  end
end
