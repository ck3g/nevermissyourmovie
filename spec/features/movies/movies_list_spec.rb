require 'rails_helper'

feature 'Movies list' do
  scenario 'can view movies list' do
    create :movie, title: 'The Big Bang Theory'
    visit movies_path

    expect(page).to have_content "Movies"
    expect(page).to have_content 'The Big Bang Theory'
  end
end
