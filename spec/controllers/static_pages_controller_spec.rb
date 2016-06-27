require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  it "gets homepage index" do
    get :home
    expect(response).to render_template("home")
  end
end
