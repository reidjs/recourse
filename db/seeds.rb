# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'byebug'
user_a = User.create(
  organization_name: 'Homeless Youth Alliance SF',
  password: 'password',
  private_wallet_key: 'cd8e63b4e307eefbe78b35108defa01e386f51d794c08d7d68e8f85af31eddfe',
  public_wallet_key: '0x7a1d9a419d6efd88a49b9e8baf8d8d67fccb3bd4'
)

user_b = User.create(
  organization_name: 'Homeless Prenatal Program',
  password: 'password',
  private_wallet_key: 'fc80c55b82772cdb8add5366ea335d5187a3b178f3b1816a9dbf11083c7333ae',
  public_wallet_key: '0xae69718147d5c95dc53141aa7fa0878ba4aa7967'
)

list1 = Listing.new(
  list_name: 'Spam - 1 pallet',
  description: 'We just received a MASSIVE shipment of spam. We have no idea what to do with them.',
  user_id: User.first.id,
  end_date: Date.tomorrow.noon,
  list_url: "http://res.cloudinary.com/dmzulpcul/image/upload/v1517159788/spam-cans_xzvymc.jpg"
)

list1.save!

Listing.create(
  list_name: 'One bushel of fresh tomatoes',
  description: 'Kids at the youth alliance are not too stoked about tomatoes. Please take these off our hands',
  user_id: user_a.id,
  end_date: Date.tomorrow.tomorrow.noon,
  list_url: "http://res.cloudinary.com/dmzulpcul/image/upload/v1517159788/1371616351150_efjphs.jpg"
)

Listing.create(
  list_name: 'Used Clothing',
  description: 'Buffalo exchange just dropped off a big shipment of large mens clothing.',
  user_id: User.last.id,
  end_date: Date.tomorrow.midnight,
  list_url: "http://res.cloudinary.com/dmzulpcul/image/upload/v1517159788/Jackets-Grade-B_pgx3gd.jpg"
)

Listing.create(
  list_name: 'First Aid Kit',
  description: 'We gutted the storage room and found a bunch of first aid kits.',
  user_id: user_a.id,
  end_date: Date.tomorrow.tomorrow.midnight,
  list_url: "http://res.cloudinary.com/dmzulpcul/image/upload/v1517159788/d46ca63f8e053463b0cf77d648dabd09_lj0bkr.jpg"
)

Listing.create(
  list_name: 'Toothpaste',
  description: 'We did a costco run and ended up with way too much toothpaste. Up for grabs!',
  user_id: User.last.id,
  end_date: Date.tomorrow.noon,
  list_url: "http://res.cloudinary.com/dmzulpcul/image/upload/v1517159788/himalaya_dentalcream-sparly-white_1280x960_yazhhc.jpg"
)

Listing.create(
  list_name: 'Canned Goods -- 30 cans!',
  description: 'After a local school drive we had waaaay too many cans left over. Start the bidding',
  user_id: User.last.id,
  end_date: Date.tomorrow.noon,
  list_url: "http://res.cloudinary.com/dmzulpcul/image/upload/v1517159788/Bags_canned_goods_eehdp7.jpg"
)
