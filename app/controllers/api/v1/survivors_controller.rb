module Api
  module V1
    class SurvivorsController < ApplicationController
      before_action :set_survivor, only: %i[show update destroy report_abduction]

      def index
        @survivors = Survivor.order('created_at DESC')
        render json: { status: 'SUCCESS', data: @survivors }, status: :ok
      end

      def show
        render json: { status: 'SUCCESS', data: @survivor }, status: :ok
      end

      def create
        @survivor = Survivor.new(survivor_params)
        if @survivor.save
          render json: { status: 'SUCCESS', message: 'Saved survivor', data: @survivor }, status: 201
        else
          render json: { status: 'ERROR', message: 'Survivor not saved', data: @survivor.errors },
                 status: :unprocessable_entity
        end
      end

      def destroy
        @survivor.destroy
        render json: { status: 'SUCCESS', message: 'Deleted survivor', data: @survivor }, status: 204
      end

      def update
        if @survivor.update(survivor_params_up)
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
        render json: { status: 'SUCCESS', data: Survivor.order(:name) }, status: :ok
      end

      def report_abduction
        @report = @survivor.reporting(params[:id_rep])
        if @report
          render json: { status: 'SUCCESS', message: 'Report received' }, status: :ok
        else
          render json: { status: 'ERROR', message: 'You cant report this survivor' }, status: :unprocessable_entity
        end
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
