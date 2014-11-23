require 'rails_helper'

RSpec.describe CreateMovie, type: :model do
  describe '#save' do
    subject { CreateMovie.new(attrs).save }

    context 'when valid attributes' do
      let(:attrs) { { title: 'Arrow' } }

      it "creates new movie" do
        expect { subject }.to change(Movie, :count).by 1
      end

      it "registers new MovieInfo job" do
        expect { subject }.to change(MovieInfoWorker.jobs, :size).by 1
      end
    end

    context 'when invalid attributes' do
      let(:attrs) { { title: '' } }

      it "do not creates new movie" do
        expect { subject }.not_to change(Movie, :count)
      end

      it "do not registers new MovieInfo job" do
        expect { subject }.not_to change(MovieInfoWorker.jobs, :size)
      end
    end
  end
end
