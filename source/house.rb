class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  def initialize(house_attributes = {})
    #, address, square_feet, num_bedrooms = 3, num_baths = 2, cost = 320_000, down_payment = 0.20, sold = false, has_tenants = false
    @address = house_attributes[:address]
    @square_feet = house_attributes[:square_feet]
    @num_bedrooms = house_attributes.fetch(:num_bedrooms) {3}
    @num_baths = house_attributes.fetch(:num_baths) {2}
    @cost = house_attributes.fetch(:cost) {320_000}
    @down_payment = house_attributes.fetch(:down_payment) {0.20}
    @sold = house_attributes.fetch(:sold) {false}
    @short_sale = house_attributes[:short_sale]
    @has_tenants = house_attributes.fetch(:has_tenants) {false}

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

house = House.new({:address =>"10315 rougemont ln", :square_feet => "2500"})
p house