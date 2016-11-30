class Users::LocationsController < LocationsController
    before_action :set_commentable

    private

    def set_locatable
      @locatable = User.find(params[:user_id])
      @view = @locatable
    end
end
