class Jobs::LocationsController < LocationsController
  before_action :set_locatable

  private

  def set_locatable
    @locatable = Job.find(params[:job_id])
    @view = @locatable
  end
end
