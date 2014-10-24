require 'rails_helper'

feature 'Create new movie' do
  scenario 'can create new movie' do
    visit new_movie_path

    within "#new_movie" do
      fill_in "movie_title", with: 'Arrow'
      check "TV Show"
      click_button 'Add Movie'
    end

    expect(page).to have_content 'Movie has been created successfully'
    expect(page).to have_selector 'a', text: 'Arrow'
  end
end
