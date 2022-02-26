class ApplicationController < ActionController::Base

  # This method is responsible to check token authenticity
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JWT.decode(header, nil, false)
      raise StandardError if Seed.where(@decode).count < 1
    rescue StandardError => e
      render json: { errors: 'Token not found' }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
