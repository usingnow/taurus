module Taurus
  module Admin
    class StocksController < BaseController

      def index
        @search = Stock.search(params[:q])
        @stocks = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

    end
  end
end