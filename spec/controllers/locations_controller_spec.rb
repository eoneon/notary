require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let(:user) { create(:user) }
  let(:location) { create(:location) }

  context "user's location" do
    before do
      location.update(locatable_id: user.id)
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, user_id: user.id, id: location.id
        expect(response).to have_http_status(:success)
      end
    end
  end
end
