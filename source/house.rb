class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  # def initialize(address, square_feet, num_bedrooms = 3, num_baths = 2, cost = 320_000, down_payment = 0.20, sold = false, has_tenants = false)
  #   @address = address
  #   @square_feet = square_feet
  #   @num_bedrooms = num_bedrooms
  #   @num_baths = num_baths
  #   @cost = cost
  #   @down_payment = down_payment
  #   @sold = sold
  #   @short_sale = short_sale
  #   @has_tenants = has_tenants
  # end

  def initialize(information = {})
    @address = information['address']
    @square_feet = information['square_feet']
    @num_bedrooms = information['num_bedrooms'] || 3
    @num_baths = information['num_baths'] || 2
    @cost = information['cost'] || 320_000
    @down_payment = information['down_payment'] || 0.20
    @sold = information['sold'] || false
    @short_sale = information['short_sale'] || false
    @has_tenants = information['has_tenants'] || false
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


my_house = House.new({'address' => '2023 Parker Street',
                      'square_feet' => 1000,
                      'num_bedrooms' => 4,
                      'num_baths' => 2,
                      'cost' => 600,
                      'down_payment' => 600,
                      'sold' => false,
                      'short_sale' => false,
                      'has_tenants' => true
                      })


p my_house

