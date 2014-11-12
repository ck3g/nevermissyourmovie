require 'rails_helper'

feature 'Approval' do
  given!(:movie) { create :movie, title: 'Elementary' }

  scenario 'Can approve pending movie' do
    create :admin_example_com

    sign_in_as 'admin@example.com'
    visit approval_movies_path
    within 'tr', text: 'Elementary' do
      click_link 'Approve'
    end

    expect(page).to have_content 'Elementary has been approved'
    expect(page).not_to have_selector 'tr', text: 'Elementary'
  end
end
