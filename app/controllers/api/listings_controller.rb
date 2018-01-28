class Api::ListingsController < ApplicationController
  def index
    @listings = Listing.all
    render :index
  end

  def create
    @listing = Listing.new(listing_params)
    Listing.save
    schedule_listing_expiration
    render :show
  end

  private

  def listing_params
    params.require(:listings).permit(:list_name, :end_date, :user_id, :list_image)
  end

  def schedule_listing_expiration
    #...
  end
end
