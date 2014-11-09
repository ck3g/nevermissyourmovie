require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, type: :model do
  subject { Ability.new user }

  context 'when user is Guest' do
    let(:user) { User.new }

    it { is_expected.to be_able_to :read, Movie }
    it { is_expected.not_to be_able_to :manage, Movie }
  end

  context 'when user is signed in' do
    let(:user) { create :user }

    it { is_expected.to be_able_to :read, Movie }
    it { is_expected.to be_able_to :manage, Movie }
  end
end

