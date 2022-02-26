class TokensController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    random_seed = SecureRandom.hex
    Seed.create(random_seed: random_seed)

    access_token = JWT.encode({random_seed: random_seed}, nil, 'none')

    render json: {token: access_token}
  end
end
