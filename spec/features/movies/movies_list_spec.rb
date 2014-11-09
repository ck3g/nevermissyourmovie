require 'rails_helper'

feature 'Movies list' do
  scenario 'can view movies list' do
    create :user_example_com
    create :movie, title: 'The Big Bang Theory'

    sign_in_as 'user@example.com'
    within 'div.navbar' do
      click_link 'Movies'
    end

    expect(page).to have_content "Movies"
    expect(page).to have_content 'The Big Bang Theory'
  end
end
