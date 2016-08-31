require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    before { @group = Group.create!(name: 'Happy Girls') }

    it 'returns http success' do
      get :show, id: @group.id
      expect(response).to have_http_status(:success)
    end
  end
end
