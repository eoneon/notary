require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  let(:user) { create(:user) }
  let(:job) { create(:job) }

  describe "DELETE destroy" do
    it "deletes the job" do
      delete :destroy, user_id: user.id, id: job.id
      count = Job.where({id: job.id}).size
      expect(count).to eq 0
    end
  end
end
