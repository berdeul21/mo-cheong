class PagesController < ApplicationController
  def home
    session[:coupon_code] = nil
  end
end