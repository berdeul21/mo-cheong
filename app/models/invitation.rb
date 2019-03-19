require 'coupon_code'

class Invitation < ApplicationRecord
	attr_accessor :coupon_code

  mount_uploader :thumb, ImageUploader
  validate :check_valid_coupon_code

  def check_valid_coupon_code
    errors.add(:coupon_code_error, '유효하지 않은 쿠폰 코드입니다.') if self.coupon_code.nil? || !CouponCode.validate(self.coupon_code)
  end
end
