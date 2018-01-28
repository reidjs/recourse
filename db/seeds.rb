# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_a = User.create(
  organization_name: 'Homeless Youth Alliance SF',
  password: 'password',
  private_wallet_key: 'cd8e63b4e307eefbe78b35108defa01e386f51d794c08d7d68e8f85af31eddfe',
  public_wallet_key: '0x7a1d9a419d6efd88a49b9e8baf8d8d67fccb3bd4'
)
_
user_b = User.create(
  organization_name: 'Homeless Prenatal Program',
  password: 'password',
  private_wallet_key: 'fc80c55b82772cdb8add5366ea335d5187a3b178f3b1816a9dbf11083c7333ae',
  public_wallet_key: '0xae69718147d5c95dc53141aa7fa0878ba4aa7967'
)

Listing.create(
  list_name: 'Baby food - 1 pallet',
  user_id: user_a.id,
  end_date: Date.tomorrow.noon
)

Listing.create(
  list_name: 'School Supplies - 200 kits',
  user_id: user_a.id,
  end_date: Date.tomorrow.noon
)

Listing.create(
  list_name: 'Hygiene Products - 300 kits',
  user_id: user_b.id,
  end_date: Date.tomorrow.noon
)

Listing.create(
  list_name: 'Clothing (toddler onesies) - 10',
  user_id: user_a.id,
  end_date: Date.tomorrow.noon
)

Listing.create(
  list_name: 'Bedding (single) - 20 sets',
  user_id: user_b.id,
  end_date: Date.tomorrow.noon
)

Listing.create(
  list_name: 'Sleeping Bags - 30',
  user_id: user_b.id,
  end_date: Date.tomorrow.noon
)
