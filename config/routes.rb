Rails.application.routes.draw do
  root 'pages#home'
  resources :invitations do
    post :check_coupon, on: :collection
  end
end
