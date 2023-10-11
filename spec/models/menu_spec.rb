# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(100) }
    it { should allow_value('Pizza Margherita').for(:name) }
    it { should_not allow_value('Pizza123').for(:name) }
    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  end

  describe 'scopes' do
    let!(:menu1) { create(:menu, name: 'Pizza Margherita', price: 10) }
    let!(:menu2) { create(:menu, name: 'Pizza Napoletana', price: 20) }
    let!(:menu3) { create(:menu, name: 'Pizza Salami', price: 30) }

    context 'search_by_name' do
      it 'returns menus that match the search term' do
        expect(Menu.search_by_name('Napoletana')).to include(menu2)
        expect(Menu.search_by_name('Napoletana')).not_to include(menu1, menu3)
      end
    end

    context 'sorted_by_price' do
      it 'sorts menus in ascending order by default' do
        expect(Menu.sorted_by_price).to eq([menu1, menu2, menu3])
      end

      it 'sorts menus in descending order when specified' do
        expect(Menu.sorted_by_price(:desc)).to eq([menu3, menu2, menu1])
      end
    end
  end

  describe 'name uniqueness' do
    it 'is invalid with a duplicate name, case insensitive' do
      create(:menu, name: 'Pizza Margherita')
      duplicate_menu = build(:menu, name: 'pizza margherita')
      expect(duplicate_menu).not_to be_valid
    end
  end
end
