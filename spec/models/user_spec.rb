require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(create :user).to be_valid
  end

  describe '.associations' do
    it { is_expected.to have_many(:movies).dependent :nullify }
    it { is_expected.to have_many(:user_movies).dependent :destroy }
    it { is_expected.to have_many :watching_movies }
  end

  describe '#watching?' do
    let(:user) { create :user }
    let(:movie) { create :movie }

    subject { user.watching? movie }

    context 'when there is user_movie record' do
      before { create :user_movie, user: user, movie: movie }
      it { is_expected.to be_truthy }
    end

    context 'when there is no user_movie record' do
      it { is_expected.to be_falsey }
    end
  end
end
