class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)

    if @user.save
      flash[:notice] = "user was updated successfully."
      redirect_to @user
    else
      flash.now[:alert] = "Error saving user. Please try again."
      render :edit
    end
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name) #, :commission_number, :commission_expiration
  end
end
