require 'rails_helper'

feature 'Watch List' do
  scenario 'can add movie to watch list' do
    create :user_example_com
    movie = create :movie, title: 'Elementary'

    sign_in_as 'user@example.com'
    visit movies_path
    within "#movie_#{movie.id}" do
      click_link 'Start watching'
    end

    expect(page).to have_content 'Elementary has been added to your watch list'
    visit watch_list_path
    expect(page).to have_content 'Elementary'
  end
end
