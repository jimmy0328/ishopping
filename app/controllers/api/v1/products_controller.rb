module Api
  module V1
    class ProductsController < ApplicationController

      skip_before_filter :verify_authenticity_token
      respond_to :json

      def index
        respond_with(Product.all)
      end

      def show
        @product = Product.find(params[:id])
      end

    end
  end
end

