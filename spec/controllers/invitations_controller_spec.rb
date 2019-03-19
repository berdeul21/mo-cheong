require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do
	describe "GET new" do
		context '청첩장 만들기에 접근한다' do
		  it "쿠폰 정보 세션이 없으면 접근할 수 없다" do
			  get :new
			  expect(response).to redirect_to(root_path)
			end

		  it "유효한 쿠폰 정보 세션이 없으면 접근할 수 없다" do
		  	session[:coupon_code] = "test"
			  get :new
			  expect(response).to redirect_to(root_path)
			end

		  it "유효한 쿠폰 정보 세션이 있으면 접근할 수 있다" do
		  	session[:coupon_code] = CouponCode.generate
			  get :new
			  expect(response.status).to eq(200)
			end
		end
	end
end