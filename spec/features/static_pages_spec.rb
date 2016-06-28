require 'rails_helper'

RSpec.feature 'help page content', :type => :feature do
	background { visit root_path }

  scenario "should have welcome message" do
    expect(page).to have_text('Welcome. Here, you can challenge other users to Tic Tac Toe matches')
  end

end