require 'rails_helper'
require 'coupon_code'

RSpec.describe Invitation, type: :model do
	context '청첩장을 만들 수 있다' do
	  it "쿠폰 코드 없이 만들 수 없다" do
	  	Invitation.create
	    expect(Invitation.count).to eq 0
		end

	  it "유효하지 않은 쿠폰 코드로는 만들 수 없다" do
		  Invitation.create(coupon_code: "test")
	    expect(Invitation.count).to eq 0
		end
		
	  it "유효한 쿠폰 코드로 만들 수 있다" do
	  	code = CouponCode.generate
		  Invitation.create(coupon_code: code)
	    expect(Invitation.count).to eq 1
		end
	end
end
