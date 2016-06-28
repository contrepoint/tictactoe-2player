require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it "gets new user page" do
    get :new
    expect(response).to render_template(:new)
  end

  it "a signed-in user can get an edit user page" do
    user = FactoryGirl.create(:user)
    sign_in user
    get :edit
    expect(response).to render_template(:edit)
  end

  it 'a non-signed-in user will be redirected to the sign-in page' do
    get :edit
    expect(response).to redirect_to(new_user_session_path)
  end

end