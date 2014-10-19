require 'rails_helper'

feature "Sign up" do
  scenario "can sign in using valid credentials" do
    visit new_user_registration_path

    within '#new_user' do
      fill_in 'Email', with: 'john.doe@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign up'
    end

    expect(page).to have_content 'You have signed up'
  end
end
