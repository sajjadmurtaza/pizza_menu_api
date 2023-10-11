# frozen_string_literal: true

class Menu < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { minimum: 2, maximum: 100 },
                   format: { with: /\A[a-zA-Z\s]+\z/, message: 'only allows letters and spaces' }

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # with pg we can use ILIKE instead of LIKE
  scope :search_by_name, ->(name) { where('LOWER(name) LIKE ?', "%#{name.downcase}%") }
  scope :sorted_by_price, ->(order = :asc) { order(price: order) }
end
