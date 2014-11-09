require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  before do
    sign_in_user
  end

  describe 'GET #index' do
    before do
      allow(Movie).to receive(:all)
      get :index
    end

    it { expect(Movie).to have_received :all }
    it { is_expected.to render_template :index }
    it { is_expected.to respond_with :success }
  end

  describe 'GET #movie' do
    before do
      allow(Movie).to receive :new
      get :new
    end

    it { expect(Movie).to have_received :new }
    it { is_expected.to render_template :new }
    it { is_expected.to respond_with :success }
  end

  describe 'POST #create' do
    let(:movie) { mock_model Movie }
    let(:attrs) do
      { 'title' => 'Title', 'tv_show' => '1' }
    end

    before do
      allow(Movie).to receive(:new).with(attrs).and_return movie
    end

    context 'when valid attributes' do
      before do
        allow(movie).to receive(:save).and_return true
        post :create, movie: attrs
      end

      it { expect(movie).to have_received :save }
      it { is_expected.to redirect_to movies_path }
      it { is_expected.to set_the_flash[:notice] }
    end

    context 'when invalid attributes' do
      before do
        allow(movie).to receive(:save).and_return false
        post :create, movie: attrs
      end

      it { expect(movie).to have_received :save }
      it { is_expected.to render_template :new }
    end
  end
end
