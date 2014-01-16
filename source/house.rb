class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  def initialize(specs = {})
    # address, square_feet, num_bedrooms = 3, num_baths = 2, 
    # cost = 320_000, down_payment = 0.20, sold = false, has_tenants = false

    @address = specs[:address]
    @square_feet = specs[:square_feet]
    @num_bedrooms = specs.fetch(:num_bedrooms, 3)
    @num_baths = specs.fetch(:num_baths, 2)
    @cost = specs.fetch(:cost, 320_000)
    @down_payment = specs.fetch(:down_payment, 0.20)
    @sold = specs.fetch(:sold, false)
    @short_sale = specs[:short_sale]
    @has_tenants = specs.fetch(:has_tenants, false)
  end

  def obscure_address
    @address.sub(/\A\d*/, '****')
  end

  def buy!(money, good_credit)
    @sold = true if money >= down_payment && good_credit
  end

  def down_payment
    cost * @down_payment
  end

  def to_s
    "#{obscure_address} : #{square_feet} sq. ft., #{num_bedrooms} bed, #{num_baths} bath. $#{cost}"
  end
end

test_house = House.new(address:"123 main st", square_feet:"3000 sq", num_bedrooms: 3,
                        short_sale: false)

p "#{test_house}"
