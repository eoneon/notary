class PeopleController < ApplicationController
  def new
    @person = Person.new
  end

  def create
    @person = @personable.people.build(person_params)

    if @person.save
      flash[:notice] = "Signer was successfully."
      redirect_to @personable
    else
      flash[:notice] = "There was an error saving the signer."
      render :new
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.assign_attributes(person_params)

    if @person.save
      flash[:notice] = "Signer's name was successfully saved."
      redirect_to @personable
    else
      flash[:notice] = "There was an error saving the signer's name"
      render :edit
    end
  end

  def destroy
    @person = @personable.people.find(params[:id])
    if @person.destroy
      flash[:notice] = "This signer was deleted successfully."
    else
      flash[:alert] = "This signer't be deleted. Try again."
    end
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :middle_name, :last_name)
  end
end
