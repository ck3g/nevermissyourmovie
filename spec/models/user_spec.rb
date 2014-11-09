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
end
