require 'rails_helper'

RSpec.describe MoviesQuery, type: :model do
  describe '.all' do
    let!(:movie) { create :movie }

    it "returns all movies" do
      expect(MoviesQuery.all).to eq [movie]
    end
  end

  describe '.pending' do
    let!(:movie) { create :movie }
    let!(:movie2) { create :movie, :approved }

    it "returns pending movies" do
      expect(MoviesQuery.pending).to eq [movie]
    end
  end
end
