require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:movie) { mock_model Movie, id: 1 }
  let(:attrs) do
    { 'title' => 'Title', 'tv_show' => '1' }
  end

  before do
    sign_in_user

    allow(Movie).to receive(:find).with('1').and_return movie
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

  describe 'GET #show' do
    before do
      get :show, id: movie.id
    end

    it { expect(Movie).to have_received :find }
    it { is_expected.to render_template :show }
    it { is_expected.to respond_with :success }
  end

  describe 'GET #new' do
    before do
      allow(Movie).to receive :new
      get :new
    end

    it { expect(Movie).to have_received :new }
    it { is_expected.to render_template :new }
    it { is_expected.to respond_with :success }
  end

  describe 'POST #create' do

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

  describe 'GET #edit' do
    before do
      get :edit, id: movie.id
    end

    it { expect(Movie).to have_received :find }
    it { is_expected.to render_template :edit }
    it { is_expected.to respond_with :success }
  end

  describe 'PATCH #update' do
    context 'when valid attributes' do
      before do
        allow(movie).to receive(:update_attributes).
          with(attrs).and_return true
        patch :update, id: movie.id, movie: attrs
      end

      it { expect(Movie).to have_received :find }
      it { expect(movie).to have_received :update_attributes }
      it { is_expected.to redirect_to movies_path }
      it { is_expected.to set_the_flash[:notice] }
    end

    context 'when invalid attributes' do
      before do
        allow(movie).to receive(:update_attributes).
          with(attrs).and_return false
        patch :update, id: movie.id, movie: attrs
      end

      it { expect(Movie).to have_received :find }
      it { expect(movie).to have_received :update_attributes }
      it { is_expected.to render_template :edit }
    end
  end

  describe 'DELETE #destroy' do
    before do
      allow(movie).to receive :destroy
      delete :destroy, id: movie.id
    end

    it { expect(movie).to have_received :destroy }
    it { is_expected.to redirect_to movies_path }
  end
end
