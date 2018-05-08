class CardsController < ApplicationController
  def index
    render json: Card.all, root: false
  end
end
