class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def show
    @package = Package.find(params[:id])
  end

  def create
    @package = Package.new(package_params)

    if @package.save
      flash[:notice] = "Package was successfully."
      redirect_to :back
    else
      flash[:alert] = "There was an error saving the package."
      redirect_to :back
    end
  end

  def update
    @package = Package.find(params[:id])
    @package.assign_attributes(package_params)

    if @package.save
      flash[:notice] = "Package was successfully."
      redirect_to :back
    else
      flash[:alert] = "There was an error saving the package"
      redirect_to :back
    end
  end

  def destroy
    @package = Package.find(params[:id])

    if @package.destroy
      flash[:notice] = "This package was deleted successfully."
      render :index
    else
      flash[:alert] = "Package couldn't be deleted. Try again."
      redirect_to :back
    end
  end

  private
  def package_params
    params.require(:package).permit(:name)
  end
end
