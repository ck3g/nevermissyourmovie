require 'rails_helper'

RSpec.describe ToWatchList, type: :model do
  describe '#execute' do
    let(:user) { create :user }
    let(:movie) { create :movie }

    subject { ToWatchList.new(movie, user).execute }

    it "creates new watch list" do
      expect { subject }.to change(UserMovie, :count).by 1
    end
  end
end
