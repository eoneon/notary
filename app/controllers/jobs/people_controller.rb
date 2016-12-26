class Jobs::PeopleController < PeopleController
  before_action :set_personable

  private

  def set_personable
    @personable = Job.find(params[:job_id])
    @view = @personable
  end
end
