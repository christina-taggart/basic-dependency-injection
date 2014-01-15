class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  def initialize(house_attr = {})
    @address = house_attr[:address]
    @square_feet = house_attr[:square_feet]
    @num_bedrooms = house_attr[:num_bedrooms] ||= 3
    @num_baths = house_attr[:num_baths] ||= 2
    @cost = house_attr[:cost] ||= 320_000
    @down_payment = house_attr[:down_payment] ||= 0.20
    @sold = house_attr[:sold] ||= false
    @short_sale = house_attr[:short_sale]
    @has_tenants = house_attr[:has_tenants] ||= false
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

# Driver Code
puts mi_casa = House.new({
  :address => "123 Sesame St.",
  :square_feet => 2000,
  :num_baths => 10,
  :cost => 1_000_000,
  :sold => true
})