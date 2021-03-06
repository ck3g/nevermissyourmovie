require 'rails_helper'

RSpec.describe WatchListsController, type: :controller do
  let!(:user) { sign_in_user }

  before do
    allow(controller).to receive(:current_user).and_return user
  end

  describe 'GET #show' do
    before do
      allow(WatchList).to receive(:for).with(user)
      allow(user).to receive :watching_movies
      get :show
    end

    it { expect(WatchList).to have_received :for }
    it { is_expected.to render_template :show }
    it { is_expected.to respond_with :success }
  end
end
