require 'rails_helper'

feature 'Password Recovery' do
  scenario 'can recover lost password' do
    create :user_example_com

    visit new_user_password_path
    within '#new_user' do
      fill_in 'user_email', with: 'user@example.com'
      click_button 'Send me reset password instructions'
    end

    expect(page).to have_content "You will receive an email with instructions"
    expect(last_email.subject).to eq 'Reset password instructions'
  end
end
