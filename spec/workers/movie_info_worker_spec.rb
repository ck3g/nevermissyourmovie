require 'rails_helper'

RSpec.describe MovieInfoWorker, type: :model do
  describe '#perform' do
    let(:movie) { mock_model Movie }
    let(:service) { double 'UpdateMovieInfo' }

    before do
      allow(Movie).to receive(:find).with(1).and_return movie
      allow(UpdateMovieInfo).to receive(:new).with(movie).
        and_return service
      allow(service).to receive(:execute)

      MovieInfoWorker.new.perform(1)
    end

    it "finds the movie" do
      expect(Movie).to have_received :find
    end

    it "updates the movie info" do
      expect(UpdateMovieInfo).to have_received :new
      expect(service).to have_received :execute
    end
  end
end
