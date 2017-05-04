class Jobs::PackageJobsController
  before_action :set_type

  private

  def set_type
    @job_type = params[:type] = "PackageJob"
  end
end
