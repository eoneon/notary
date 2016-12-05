class Users::PhonesController < PhonesController
  before_action :set_phoneable

  private

  def set_phoneable
    @phoneable = User.find(params[:user_id])
    @view = @phoneable
  end
end
