# frozen_string_literal: true

class FetchMenusService
  def initialize(search_name = nil, sort_order = nil)
    @search_name = search_name
    @sort_order = sort_order || 'asc'
  end

  def call
    menus = Menu.all
    menus = filter_by_name(menus)
    sort_by_price(menus)
  end

  private

  def filter_by_name(menus)
    return menus unless @search_name.present?

    menus.search_by_name(@search_name)
  end

  def sort_by_price(menus)
    menus.sorted_by_price(@sort_order)
  end
end
