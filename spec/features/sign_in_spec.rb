require 'rails_helper'

feature 'Sign in' do
  scenario 'can sign in using valid credentials' do
    create :user_example_com

    sign_in_as 'user@example.com'

    expect(page).to have_content "Signed in successfully"
  end
end
