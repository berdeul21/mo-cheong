require 'coupon_code'

class Coupon < ApplicationRecord
	self.primary_key = 'code'

	validate :check_valid_coupon_code

  def check_valid_coupon_code
    errors.add(:coupon_code_error, '유효하지 않은 쿠폰 코드입니다.') if self.code.nil? || !CouponCode.validate(self.code)
  end
end
