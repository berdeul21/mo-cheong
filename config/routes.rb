Rails.application.routes.draw do
  root 'pages#home'
  
  resources :invitations do
    post :check_coupon, on: :collection
  end

  # admin
  namespace :admin, :path => 'nimda' do
    root 'invitations#index'
    resources :invitations
	end
end
