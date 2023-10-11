# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FetchMenusService do
  let!(:menu1) { create(:menu, name: 'Pizza Margherita', price: 10) }
  let!(:menu2) { create(:menu, name: 'Pizza Napoletana', price: 20) }
  let!(:menu3) { create(:menu, name: 'Pizza Salami', price: 15) }

  describe '#call' do
    context 'when no parameters are provided' do
      subject { described_class.new.call }

      it 'returns all menus' do
        expect(subject.count).to eq(3)
      end
    end

    context 'when a search_name is provided' do
      subject { described_class.new('Napoletana').call }

      it 'filters menus by name' do
        expect(subject.count).to eq(1)
        expect(subject.first.name).to eq('Pizza Napoletana')
      end
    end

    context 'when sort_order is provided' do
      context 'with ascending order' do
        subject { described_class.new(nil, 'asc').call }

        it 'sorts menus by price in ascending order' do
          expect(subject.first.name).to eq('Pizza Margherita')
          expect(subject.last.name).to eq('Pizza Napoletana')
        end
      end

      context 'with descending order' do
        subject { described_class.new(nil, 'desc').call }

        it 'sorts menus by price in descending order' do
          expect(subject.first.name).to eq('Pizza Napoletana')
          expect(subject.last.name).to eq('Pizza Margherita')
        end
      end
    end

    context 'when both search_name and sort_order are provided' do
      subject { described_class.new('Pizza', 'desc').call }

      it 'filters and then sorts the menus' do
        expect(subject.count).to eq(3)
        expect(subject.first.name).to eq('Pizza Napoletana')
        expect(subject.last.name).to eq('Pizza Margherita')
      end
    end
  end
end
