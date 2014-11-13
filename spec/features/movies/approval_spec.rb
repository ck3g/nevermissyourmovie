require 'rails_helper'

feature 'Approval' do
  given!(:movie) { create :movie, title: 'Elementary' }

  background do
    create :admin_example_com
    sign_in_as 'admin@example.com'
  end

  scenario 'Can approve pending movie' do
    visit approval_movies_path
    within 'tr', text: 'Elementary' do
      click_link 'Approve'
    end

    expect(page).to have_content 'Elementary has been approved'
    expect(page).not_to have_selector 'tr', text: 'Elementary'
  end

  scenario 'Can reject pending movie' do
    visit approval_movies_path
    within 'tr', text: 'Elementary' do
      click_link 'Reject'
    end

    expect(page).to have_content 'Elementary has been rejected'
    expect(page).not_to have_selector 'tr', text: 'Elementary'
  end
end
