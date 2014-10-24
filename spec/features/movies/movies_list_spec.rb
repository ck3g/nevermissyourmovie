require 'rails_helper'

feature 'Movies list' do
  scenario 'can view movies list' do
    visit movies_path

    expect(page).to have_content "Movies"
  end
end
