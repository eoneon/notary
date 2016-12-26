class People::EmailsController < EmailsController
  before_action :set_emailable

  private

  def set_emailable
    @emailable = Person.find(params[:person_id])
    @view = Job.find(@emailable.personable_id)
  end
end
