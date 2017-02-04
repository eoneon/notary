class JobsController < ApplicationController
  def index
    @jobs = current_user.jobs
  end

  def show
    @job = Job.find(params[:id])
  end

  def invoice
    @job = Job.find(params[:job_id])
  end

  def new
    @user = current_user
    @job = Job.new
  end

  def create
    @user = current_user
    @job = @user.jobs.build(job_params)

    if @job.save
      flash[:notice] = "Job was successfully saved."
      redirect_to @job
    else
      flash[:alert] = "There was an error saving the job. Please try again."
      render :new
    end
  end

  def edit
    @user = current_user
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.assign_attributes(job_params)

    if @job.save
      flash[:notice] = "Job was successfully updated."
      redirect_to @job
    else
      flash[:alert] = "There was an error updating the job. Please try again."
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])

    if @job.destroy
      flash[:notice] = "Job was deleted successfully."
      redirect_to action: :index
    else
      flash[:alert] = "Job couldn't be deleted. Try again."
      render :show
    end
  end

  private
  def job_params
    params.require(:job).permit(:job_date, :job_status, :type, :billable_id)
  end
end
