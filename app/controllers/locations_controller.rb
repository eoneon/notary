class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    @location = @locatable.locations.build(location_params)

    if @location.save
      flash[:notice] = "Address was successfully saved."
      redirect_to @locatable
    else
      flash[:alert] = "There was an error saving address."
      render :new
    end
  end

  def update
    @location = Location.find(params[:id])
    @location.assign_attributes(location_params)

    if @location.save
      flash[:notice] = "Address was successfully saved."
      redirect_to @locatable
    else
      flash[:alert] = "There was an error saving address."
      render :edit
    end
  end

  def destroy
    @location = @locatable.locations.find(params[:id])
    if @location.destroy
      flash[:notice] = "Location was deleted successfully."
    else
      flash[:alert] = "Location couldn't be deleted. Try again."
    end
  end

  private

  def location_params
    params.require(:location).permit(:address)
  end
end
