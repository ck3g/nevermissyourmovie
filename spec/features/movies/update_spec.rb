require 'rails_helper'

feature 'Update movie' do
  scenario 'can update with valid arguments' do
    movie = create :movie, title: 'TBBT'
    create :user_example_com

    sign_in_as 'user@example.com'
    visit movies_path

    within "#movie_#{movie.id}" do
      click_link 'Edit'
    end
    within "#edit_movie_#{movie.id}" do
      fill_in 'movie_title', with: 'The Big Bang Theory'
      click_button 'Update'
    end

    expect(page).to have_content 'Movie has been updated successfully'
    expect(page).to have_content 'The Big Bang Theory'
    expect(page).not_to have_content 'TBBT'
  end
end
