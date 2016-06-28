require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it "gets new user page" do
    get :new
    expect(response).to render_template("new")
  end

  # it "gets edit user page" do
  #   get :new
  #   expect(response).to render_template("edit")
  # end
end