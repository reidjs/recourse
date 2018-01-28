json.set! 'listings' do
  @listings.each do |listing|
    json.set! listing.id do
      json.extract! listing, :id, :list_name, :end_date, :description

      json.set! 'lister' do
        json.extract! listing.user, :organization_name, :id, :public_wallet_key
      end

      json.set! 'bids' do
        listing.bids.each do |bid|
          json.set! bid.id do
            json.extract! bid, :id, :user_id, :amount
            json.extract! bid.bidder :organization_name
          end
        end
      end
    end
  end
end
