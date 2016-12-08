class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    @email = @emailable.emails.build(email_params)
    @new_email = Email.new

    if @email.save
      flash[:notice] = "Email was successfully saved."
      redirect_to @emailable
    else
      flash[:notice] = "There was an error saving email."
      render :new
    end
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    @email.assign_attributes(email_params)

    if @email.save
      flash[:notice] = "Email was successfully saved."
      redirect_to @emailable
    else
      flash[:notice] = "There was an error saving email."
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
