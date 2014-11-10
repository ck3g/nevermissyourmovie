require 'rails_helper'

RSpec.describe WatchList, type: :model do
  describe '.for' do
    let(:user) { create :user }
    let(:movie) { create :movie }
    let!(:another_movie) { create :movie }

    before do
      create :user_movie, user: user, movie: movie
    end

    subject { WatchList.for user }

    it "removes user's wathing movies" do
      expect(subject.to_a).to eq [movie]
    end
  end
end
