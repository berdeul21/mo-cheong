class AdminController < ApplicationController
  unless Rails.env.test?
    http_basic_authenticate_with name: "admin", password: "qwer1234"
  end
  
  layout "admin"
end