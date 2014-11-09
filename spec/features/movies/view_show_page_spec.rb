require 'rails_helper'

feature "Movie page" do
  scenario 'can navigate to show page' do
    create :movie, title: 'The Big Bang Theory'

    visit movies_path
    click_link 'The Big Bang Theory'

    expect(page).to have_selector 'h1', text: 'The Big Bang Theory'
  end
end
