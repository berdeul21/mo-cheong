Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  
  resources :invitations do
    post :check_coupon, on: :collection
  end

  # admin
  namespace :admin, :path => 'nimda' do
    root 'invitations#index'
    resources :invitations
    resources :coupons, only: [:index, :create]
	end
end
