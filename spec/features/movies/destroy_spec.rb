require 'rails_helper'

feature 'Delete movie' do
  scenario 'can delete movie from list' do
    create :user_example_com
    movie = create :movie, title: 'Wrong Movie Title'

    sign_in_as 'user@example.com'
    visit movies_path
    within "#movie_#{movie.id}" do
      click_link 'Delete'
    end

    expect(page).not_to have_content 'Wrong Movie Title'
  end
end
