require 'rails_helper'

RSpec.describe CreateMovie, type: :model do
  describe '#save' do
    subject { CreateMovie.new(title: 'Arrow').save }

    it "creates new movie" do
      expect { subject }.to change(Movie, :count).by 1
    end
  end
end
