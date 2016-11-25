require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #show" do
    it "returns http success" do
      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, id: user.id
      expect(response).to render_template :show
    end

    it "assigns user to @user" do
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: user.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, id: user.id
      expect(response).to render_template :edit
    end

    it "assigns user to be updated to @user" do
      get :edit, id: user.id

      user_instance = assigns(:user)

      expect(user_instance.id).to eq user.id
      expect(user_instance.first_name).to eq user.first_name
      expect(user_instance.last_name).to eq user.last_name
    end
  end

  describe "PUT #update" do
    it "updates user with expected attributes" do
      new_email = "fred@io.com"
      new_first_name = "Fred"
      new_last_name = "Sanford"
      # new_commission_number = "12345678"

      put :update, id: user.id, post: {new_email: new_email, first_name: new_first_name, last_name: new_last_name}

      updated_user = assigns(:user)
      expect(updated_user.id).to eq user.id
      expect(updated_user.first_name).to eq new_first_name
      expect(updated_user.last_name).to eq new_last_name
    end

    it "redirects to the updated user" do
      new_first_name = "Fred"
      new_last_name = "Sanford"

      put :update, id: user.id, post: {first_name: new_first_name, last_name: new_last_name}
      expect(response).to redirect_to :show
    end
  end

  describe "DELETE destroy" do
    it "returns http success" do
      delete :destroy, id: user.id
      expect(response).to welcome_path
    end
  end
end
