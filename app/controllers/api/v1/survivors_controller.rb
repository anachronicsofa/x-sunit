module Api
  module V1
    class SurvivorsController < ApplicationController
      def index
        survivors = Survivor.order('created_at DESC')
        render json: { status: 'SUCCESS', data: survivors }, status: :ok
      end
    end
  end
end
