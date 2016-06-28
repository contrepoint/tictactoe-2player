require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it 'gets sign in page' do
    get :new
    expect(response).to render_template(:new)
  end
end