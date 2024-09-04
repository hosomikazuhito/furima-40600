require 'rails_helper'

RSpec.describe GoodsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new good with an image' do
        expect {
          post :create, params: { good: attributes_for(:good) }
        }.to change(Good, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new good without an image' do
        expect {
          post :create, params: { good: attributes_for(:good, image: nil) }
        }.not_to change(Good, :count)
      end
    end
  end
end