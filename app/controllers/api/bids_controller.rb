class Api::BidsController < ApplicationController
  def create
    @bid = Bid.new(bid_params)
    if @bid.save
      render :show
    else
      render :json, @bid.errors.full_messages
    end
  end

  private

  def bid_params
    params.require(:bids).permit(:listing_id, :amount)
  end
end
