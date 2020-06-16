module Api
  module V1
    class SurvivorsController < ApplicationController
      before_action :set_survivor, only: %i[show update destroy]

      def index
        @survivors = Survivor.order('created_at DESC')
        render json: { status: 'SUCCESS', data: @survivors }, status: :ok
      end

      def show
        @survivor = Survivor.find(params[:id])
        render json: { status: 'SUCCESS', data: @survivor }, status: :ok
      end

      def create
        @survivor = Survivor.new(survivor_params)
        if @survivor.save
          render json: { status: 'SUCCESS', message: 'Saved survivor', data: @survivor }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Survivor not saved', data: @survivor.errors },
                 status: :unprocessable_entity
        end
      end

      def destroy
        @survivor = Survivor.find(params[:id])
        @survivor.destroy
        render json: { status: 'SUCCESS', message: 'Deleted survivor', data: @survivor }, status: :ok
      end

      def update
        @survivor = Survivor.find(params[:id])
        if @survivor.update_attributes(survivor_params_up)
          render json: { status: 'SUCCESS', message: 'Updated survivor', data: @survivor }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Survivor not update', data: @survivor.errors },
                 status: :unprocessable_entity
        end
      end

      def percentage_of_abducted
        render json: { status: 'SUCESS', message: 'The percentage of abducted survivors: ',
                       data: Survivor.report_abducted }
      end

      def percentage_of_non_abducted
        render json: { status: 'SUCESS', message: 'The percentage of non abducted survivors: ',
                       data: Survivor.report_non_abducted }
      end

      def show_alphabetic_order
        @survivors = Survivor.order(:name)
        render json: { status: 'SUCCESS', data: @survivors }, status: :ok
      end

      private

      def set_survivor
        @survivor = Survivor.find(params[:id])
      end

      def survivor_params
        params.require(:survivor).permit(:name, :birthdate, :gender, :latitude,
                                         :longitude, :reports_received, :abducted)
      end

      def survivor_params_up
        params.require(:survivor).permit(:latitude, :longitude)
      end
    end
  end
end
