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
        get :new, locatable_id: user.id, id: location.id
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST create" do
      it "increases the number of locations by 1" do
        expect{ post :create, locatable_id: user.id, location: {address: "address"} }.to change(Location,:count).by(1)
      end

      it "assigns the new location to @location" do
        post :create, locatable_id: user.id, locatable: {address: "address"}
        expect(assigns(:location)).to eq Location.last
      end
    end
  end
end
