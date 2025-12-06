Rails.application.routes.draw do
  get "favorites/index"
  get "carts/show"
  get "contacts/new"
  get "contacts/create"
 
  get "products/index"
  get "products/shirts"
  get "products/sneakers"
  get "products/sweats"
  get "products/afters"
  get "products/pants"
  root "pages#home"

  get "/support", to: "pages#support"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  get "/shirts",  to: "products#shirts"
  get "/sneakers", to: "products#sneakers"
  get "/sweats",   to: "products#sweats"
  get "/afters",   to: "products#afters"
  get "/pants",    to: "products#pants"

  devise_for :users

  devise_scope :user do
    post "guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  get  "/contact", to: "contacts#new",    as: :contact
  post "/contact", to: "contacts#create"

  resource :cart, only: :show

  resources :cart_items, only: [:create, :update, :destroy]

  resources :products, only: [:show] do
  collection do
    get :search
  end
end

  resources :favorites, only: [:index, :create, :destroy]


end
