require 'rails_helper'

RSpec.describe StopWatching, type: :model do
  describe '#execute' do
    let(:user) { create :user }
    let(:movie) { create :movie }

    subject { StopWatching.new(movie, user).execute }

    context 'when user movie exists' do
      before { create :user_movie, user: user, movie: movie }

      it "removes user_movie record" do
        expect { subject }.to change(UserMovie, :count).by -1
      end
    end

    context 'when user movie is not exists' do
      it "do not removes user_movie record" do
        expect { subject }.not_to change(UserMovie, :count)
      end
    end
  end
end
