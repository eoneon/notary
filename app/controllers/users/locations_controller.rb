class Users::LocationsController < LocationsController
  before_action :set_locatable

  private

  def set_locatable
    @locatable = User.find(params[:user_id])
    @view = @locatable
  end
end
