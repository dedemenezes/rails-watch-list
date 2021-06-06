Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "lists#index"

  resources :lists do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: [:create]
  end

  resources :bookmarks, only: [:destroy]
  resources :reviews, only: [:destroy]
  resources :movies, only: [:index] do
    collection do
      get "/:id", to: "movies#show", as: :movie
    end
  end

end
