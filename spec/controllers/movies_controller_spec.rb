require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe 'GET #index' do
    before do
      get :index
    end

    it { is_expected.to render_template :index }
    it { is_expected.to respond_with :success }
  end
end
