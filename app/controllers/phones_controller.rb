class PhonesController < ApplicationController
  def new
    @phone = Phone.new
  end

  def create
    @phone = @phoneable.phones.build(phone_params)
    @new_phone = Phone.new

    if @phone.save
      flash[:notice] = "Phone number number was successfully saved."
      redirect_to @view
    else
      flash[:alert] = "Phone failed to save."
      render :new
    end
  end

  def edit
    @phone = Phone.find(params[:id])
  end

  def update
    @phone = Phone.find(params[:id])
    @phone.assign_attributes(phone_params)

    if @phone.save
      flash[:notice] = "Phone number was successfully saved."
      redirect_to @phoneable
    else
      flash[:notice] = "There was an error saving phone number."
      render :edit
    end
  end

  def destroy
    @phone = @phoneable.phones.find(params[:id])
    if @phone.destroy
      flash[:notice] = "Phone number was deleted successfully."
    else
      flash[:alert] = "Phone couldn't be deleted. Try again."
    end
  end
  
  private

  def phone_params
    params.require(:phone).permit(:phone_number, :phone_type)
  end
end
