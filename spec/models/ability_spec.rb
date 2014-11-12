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
    let!(:user) { create :user }
    let!(:movie) { create :movie }
    let!(:my_movie) { create :movie, user: user }
    let!(:my_approved_movie) { create :movie, :approved, user: user }

    it { is_expected.to be_able_to :read, Movie }
    it { is_expected.to be_able_to :create, Movie }
    it { is_expected.to be_able_to :watch, Movie }
    it { is_expected.to be_able_to :stop_watching, Movie }
    it { is_expected.not_to be_able_to :edit, movie }
    it { is_expected.not_to be_able_to :update, movie }
    it { is_expected.not_to be_able_to :destroy, movie }
    it { is_expected.to be_able_to :edit, my_movie }
    it { is_expected.to be_able_to :update, my_movie }
    it { is_expected.to be_able_to :destroy, my_movie }
    it { is_expected.not_to be_able_to :edit, my_approved_movie }
    it { is_expected.not_to be_able_to :update, my_approved_movie }
    it { is_expected.not_to be_able_to :destroy, my_approved_movie }
    it { is_expected.to be_able_to :show, :watch_list }
  end

  context 'when user is admin' do
    let!(:user) { create :user, :admin }
    let!(:movie) { create :movie }
    let!(:my_movie) { create :movie, user: user }
    let!(:my_approved_movie) { create :movie, :approved, user: user }

    it { is_expected.to be_able_to :manage, :all }
    it { is_expected.to be_able_to :manage, movie }
    it { is_expected.to be_able_to :manage, my_movie }
    it { is_expected.to be_able_to :manage, my_approved_movie }
  end
end

