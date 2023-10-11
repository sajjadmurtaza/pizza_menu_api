# frozen_string_literal: true

module Api
  module V1
    class MenusController < ApplicationController
      def index
        menus = FetchMenusService.new(search_params, sort_order).call
        render json: menus
      end

      private

      def search_params
        params[:name]
      end

      def sort_order
        params[:order]
      end
    end
  end
end
