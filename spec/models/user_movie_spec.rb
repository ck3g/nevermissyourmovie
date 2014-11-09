require 'rails_helper'

RSpec.describe UserMovie, type: :model do
  it 'has a valid factory' do
    expect(create :user_movie).to be_valid
  end

  describe '.associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :movie }
  end

  describe '.validation' do
    context 'when valid' do
      subject { create :user_movie }
      it { is_expected.to validate_presence_of :user }
      it { is_expected.to validate_presence_of :movie }
      it do
        is_expected.to validate_uniqueness_of(:movie_id).scoped_to :user_id
      end
    end
  end
end
