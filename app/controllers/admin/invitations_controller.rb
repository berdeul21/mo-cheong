class Admin::InvitationsController < AdminController
  def index
  	@invitations = Invitation.order('created_at DESC')
  end
end
