class Api::BidsController < ApplicationController
  def index
    @bids = Bid.all
    render :index
  end

  def create
    @bid = Bid.new(bid_params)
    if @bid.save
      render :show
    else
      render :json, @bid.errors.full_messages
    end
  end

  def destroy
    @bid = Bid.find_by_id[params[:id]]
    if @bid.destroy
      render :json, {}
    else
      render :json, @bid.errors.full_messages
    end
  end

  private

  def bid_params
    params.require(:bids).permit(:listing_id, :amount)
  end
end
