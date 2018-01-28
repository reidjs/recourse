json.bids do
  @bids.each do |bid|
    json.set! bid.id do
      json.partial! 'api/bids/bid', bid: bid
    end
  end
end
