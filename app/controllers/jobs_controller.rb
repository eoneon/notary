class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
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
      redirect_to [@user, @job]
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
      redirect_to [@job.user, @job]
    else
      flash[:alert] = "There was an error updating the job. Please try again."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @job = @user.jobs.find(params[:id])

    if @job.destroy
      flash[:notice] = "Job was deleted successfully."
    else
      flash[:alert] = "Job couldn't be deleted. Try again."
    end
  end

  private
  def job_params
    params.require(:job).permit(:job_date, :job_status)
  end
end
