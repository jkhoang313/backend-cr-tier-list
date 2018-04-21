class TierListTypesController < ApplicationController
  def index
    render json: TierListType.all, root: false
  end
end
