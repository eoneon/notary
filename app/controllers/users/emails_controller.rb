class Users::EmailsController < EmailsController
  before_action :set_emailable

  private

  def set_emailable
    @emailable = User.find(params[:user_id])
  end
end
