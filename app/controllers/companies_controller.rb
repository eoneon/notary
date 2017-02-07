class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      flash[:notice] = "Company was successfully."
      redirect_to :back
    else
      flash[:alert] = "There was an error saving the company."
      redirect_to :back
    end
  end

  def update
    @company = Company.find(params[:id])
    @company.assign_attributes(company_params)

    if @company.save
      flash[:notice] = "Company was successfully."
      redirect_to :back
    else
      flash[:alert] = "There was an error saving the company"
      redirect_to :back
    end
  end

  def destroy
    @company = Company.find(params[:id])

    if @company.destroy
      flash[:notice] = "This company was deleted successfully."
      render :back
    else
      flash[:alert] = "Company couldn't be deleted. Try again."
      redirect_to :back
    end
  end

  private
  def company_params
    params.require(:company).permit(:name)
  end
end
