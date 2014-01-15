class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost, :has_tenants, :sold, :down_payment

  def initialize(information = {})
    @address = information.fetch(:address)
    @square_feet = information.fetch(:square_feet)
    @num_bedrooms = information.fetch(:num_bedrooms, 3)
    @num_baths = information.fetch(:num_baths, 2)
    @cost = information.fetch(:cost, 320_000)
    @down_payment = information.fetch(:down_payment, 0.20)
    @sold = information.fetch(:sold, false)
    @short_sale = information.fetch(:short_sale, false)
    @has_tenants = information.fetch(:has_tenants, false)
  end

  def buy!(money, good_credit)
    @sold = true if qualified_buyer?(money, good_credit)
  end

  def down_payment
    cost * @down_payment
  end

  def to_s
    "#{obscure_address} : #{square_feet} sq. ft., #{num_bedrooms} bed, #{num_baths} bath. $#{cost}"
  end

  private

  def qualified_buyer?(money, good_credit)
    (money >= down_payment) && good_credit
  end

  def obscure_address
    @address.sub(/\A\d*/, '****')
  end

end


my_house = House.new({address: '2023 Parker Street',
  square_feet: 1000,
  num_bedrooms: 4,
  num_baths: 2,
  cost: 50000,
  down_payment: 0.15,
  sold: false,
  short_sale: false,
  has_tenants: true
  })

p my_house
p my_house.has_tenants == true
p my_house.square_feet == 1000
p my_house.num_bedrooms == 4
p my_house.num_baths == 2

my_house.buy!(20000, true)
p my_house.sold == true



