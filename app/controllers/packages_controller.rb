class PackagesController < ApplicationController
  def create
    @package = Package.new(package_params)

    if @package.save
      flash[:notice] = "Package was successfully."
      redirect_to :back
    else
      flash[:notice] = "There was an error saving the package."
      render :new
    end
  end

  private
  def package_params
    params.require(:package).permit(:name)
  end
end
