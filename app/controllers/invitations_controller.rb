class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    redirect_to root_path if session[:coupon_code].nil? || !CouponCode.validate(session[:coupon_code])
    @invitation = Invitation.new
  end

  def edit
  end

  def create
    @invitation = Invitation.new(invitation_params)

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to @invitation, notice: 'Invitation was successfully created.' }
        format.json { render :show, status: :created, location: @invitation }
      else
        format.html { render :new }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @invitation.update(invitation_params)
        format.html { redirect_to @invitation, notice: 'Invitation was successfully updated.' }
        format.json { render :show, status: :ok, location: @invitation }
      else
        format.html { render :edit }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to invitations_url, notice: 'Invitation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_coupon
    if CouponCode.validate(params["coupon_code"])
      session[:coupon_code] = params["coupon_code"]
      render json: { code: 200 }
    else
      render json: { code: 204, msg: '유효하지 않은 쿠폰 코드입니다.'}
    end
  end

  private
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    def invitation_params
      # params.fetch(:invitation, {})
      params.require(:invitation).permit(:d_day, :title, :thumb, :description, :directions, :contact_bride, :contact_groom, :contact_other)
    end
end
