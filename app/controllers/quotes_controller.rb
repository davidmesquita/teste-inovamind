class QuotesController < ApplicationController
  before_action :authorize_request, except: :create

  def show
    @quotes = Quote.where(tags: permitted_params[:search_tag])

    render json: @quotes
  end

  private

  def permitted_params
    params.permit(:search_tag)
  end
end
