require 'rails_helper'

feature 'Stop Watching' do
  scenario 'can stop watching a movie' do
    user_movie = create :user_movie,
      user: create(:user_example_com),
      movie: create(:movie, title: 'The Flash')

    sign_in_as 'user@example.com'
    visit watch_list_path
    within "#movie_#{user_movie.movie_id}" do
      click_link 'Stop watching'
    end

    expect(page).to have_content 'You have stopped watching The Flash movie'
    within '#movies' do
      expect(page).not_to have_content 'The Flash'
    end
  end
end
