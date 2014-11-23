require 'rails_helper'

RSpec.describe UpdateMovieInfo, type: :model do
  describe '#execute' do
    let(:strategy) { double "Strategy" }
    let!(:movie) { create :movie, title: 'Arrow' }

    context 'when movie has no IMDb ID' do
      before do
        allow(UpdateMovie::RottenTomatoesStrategy).to receive(:new).
          with(title: 'Arrow').and_return strategy
        allow(strategy).to receive(:info).and_return(
          OpenStruct.new(title: 'Arrow',
                         movie_type: 'series',
                         imdb_id: 'tt2193021',
                         poster: "http://imdb.com/posters/arrow.jpg",
                         plot: 'Arrow plot description')
        )


        UpdateMovieInfo.new(movie).execute
      end

      it "updates movie type to series" do
        expect(movie.movie_type).to eq 'series'
      end

      it "updates movie imdbID" do
        expect(movie.imdb_id).to eq 'tt2193021'
      end

      it "updates a poster" do
        expect(movie.poster).to eq "http://imdb.com/posters/arrow.jpg"
      end

      it "updates the plot" do
        expect(movie.plot).to eq "Arrow plot description"
      end
    end
  end
end
