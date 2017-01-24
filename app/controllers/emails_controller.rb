class EmailsController < ApplicationController
  def create
    @email = @emailable.emails.build(email_params)

    if @email.save
      flash[:notice] = "Email was successfully saved."
      redirect_to @view
    else
      flash[:alert] = "There was an error saving email."
      render :new
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.assign_attributes(email_params)

    if @email.save
      flash[:notice] = "Email was successfully saved."
      redirect_to @view
    else
      flash[:alert] = "There was an error saving email."
      render :edit
    end
  end

  def destroy
    @email = @emailable.emails.find(params[:id])
    if @email.destroy
      flash[:notice] = "Email was deleted successfully."
    else
      flash[:alert] = "Email couldn't be deleted. Try again."
    end
  end

  private

  def email_params
    params.require(:email).permit(:email)
  end
end
