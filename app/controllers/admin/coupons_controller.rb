class Admin::CouponsController < AdminController
  def index
  	@coupons = Coupon.order('created_at DESC')
  	@coupon = Coupon.new
  end

  def create
	  @coupon = Coupon.new
	  @coupon.code = CouponCode.generate

	  respond_to do |format|
	    if @coupon.save
	      format.js   { }
	      format.json { render :show, status: :created, location: @coupon }
	    else
	      format.json { render json: @coupon.errors, status: :unprocessable_entity }
	    end
	  end
	end
end
