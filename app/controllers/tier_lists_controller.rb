class TierListsController < ApplicationController
  def index
    list_type = params["list_type"].to_i

    tier_lists = TierList.joins(:tier_list_types).where(tier_list_types: { id: list_type }).order(upvotes: :DESC)

    render json: tier_lists, root: false
  end
end
