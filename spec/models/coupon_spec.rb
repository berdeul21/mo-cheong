require 'rails_helper'

RSpec.describe Coupon, type: :model do
  it "쿠폰을 생성할 수 있다" do
  	code = CouponCode.generate
  	Coupon.create(code: code)
    expect(Coupon.count).to eq 1
	end
end
