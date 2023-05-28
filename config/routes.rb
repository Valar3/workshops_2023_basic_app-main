Rails.application.routes.draw do
  resources :books do
    collection do
    get 'search'
    end
    end
  resources :publishers
  resources :authors
  resources :categories
  resources :book_loans, only: [:create] do
    member do
      post 'cancel'
    end
  end
  resources :book_reservations, only: [:create] do
    member do
      post 'cancel'
    end
  end
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root 'books#index'
  get '/book-requests', to: 'book_requests#index', as: 'book_requests'
end
