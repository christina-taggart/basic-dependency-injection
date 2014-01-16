class House
  attr_reader :square_feet, :address, :square_feet, :num_bedrooms, :num_baths, :cost, :down_payment, :sold, :short_sale, :has_tenants


  def initialize(house_components = {})
    @address = house_components[:address]
    @square_feet = house_components[:square_feet]
    @num_bedrooms = house_components.fetch(:num_bedrooms, 3)
    @num_baths = house_components.fetch(:num_baths, 2)
    @cost = house_components.fetch(:cost, 320_000)
    @down_payment = house_components.fetch(:down_payment, 0.20)
    @sold = house_components.fetch(:sold, false)
    @short_sale = house_components[:short_sale]
    @has_tenants = house_components.fetch(:has_tenants, false)
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

doctor = House.new
p doctor.num_bedrooms == 3
p doctor.num_baths == 2
p doctor.down_payment == 64000.0

ezekiel = House.new(:square_feet => 200, :cost => 300_000, :has_tenants => true)
p ezekiel.sold == false
p ezekiel.has_tenants == true
p ezekiel.square_feet == 200
p ezekiel.cost == 300_000
