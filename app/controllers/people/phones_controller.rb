class People::PhonesController < PhonesController
  before_action :set_phoneable

  private

  def set_phoneable
    @phoneable = Person.find(params[:person_id])
    @view = Job.find(@phoneable.personable_id)
  end
end
