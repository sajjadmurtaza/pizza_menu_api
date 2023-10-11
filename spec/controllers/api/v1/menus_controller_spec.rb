# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::MenusController, type: :controller do
  let!(:menu1) { create(:menu, name: 'Pizza Margherita', price: 10) }
  let!(:menu2) { create(:menu, name: 'Pizza Napoletana', price: 20) }
  let!(:menu3) { create(:menu, name: 'Pizza Salami', price: 30) }

  describe 'GET #index' do
    context 'without params' do
      it 'returns all menus' do
        get :index, params: { order: 'asc' }
        expect(response).to have_http_status(:success)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body.count).to eq(3)
      end
    end

    context 'with search params' do
      it 'returns menus matching the name' do
        get :index, params: { name: 'Napoletana', order: 'asc' }
        expect(response).to have_http_status(:success)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body.count).to eq(1)
        expect(parsed_body.first['name']).to eq('Pizza Napoletana')
      end
    end

    context 'with sort params' do
      it 'returns menus sorted by price in ascending order' do
        get :index, params: { order: 'asc' }
        expect(response).to have_http_status(:success)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body.first['name']).to eq('Pizza Margherita')
      end

      it 'returns menus sorted by price in descending order' do
        get :index, params: { order: 'desc' }
        expect(response).to have_http_status(:success)
        parsed_body = JSON.parse(response.body)
        expect(parsed_body.first['name']).to eq('Pizza Salami')
      end
    end
  end
end
