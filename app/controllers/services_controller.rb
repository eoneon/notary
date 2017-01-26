class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def create
    @service = Service.new(service_params)

    if @service.save
      flash[:notice] = "Service was successfully."
      redirect_to :back
    else
      flash[:alert] = "There was an error saving the service."
      redirect_to :back
    end
  end

  def update
    @service = Service.find(params[:id])
    @service.assign_attributes(service_params)

    if @service.save
      flash[:notice] = "Service was successfully."
      redirect_to :back
    else
      flash[:alert] = "There was an error saving the service"
      redirect_to :back
    end
  end

  def destroy
    @service = Service.find(params[:id])

    if @service.destroy
      flash[:notice] = "This service was deleted successfully."
      render :back
    else
      flash[:alert] = "service couldn't be deleted. Try again."
      redirect_to :back
    end
  end

  private
  def service_params
    params.require(:service).permit(:name)
  end
end
