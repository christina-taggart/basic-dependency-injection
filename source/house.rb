class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost, :has_tenants

  def initialize(spec = {})

    @address = spec.fetch(:address) {"happy place"}
    @square_feet = spec.fetch(:square_feet) {9000}
    @num_bedrooms = spec.fetch(:num_bedrooms) {3}
    @num_baths = spec.fetch(:num_baths) {2}
    @cost = spec.fetch(:cost) {320_000}
    @down_payment = spec.fetch(:down_payment) {0.20}
    @sold = spec.fetch(:sold) {false}
    @short_sale = "short_sale"
    @has_tenants = spec.fetch(:has_tenants) {false}
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


p my_house = House.new(address: "4335 favorite ave")
p your_house = House.new(square_feet: 5555,  num_baths: 5, cost: 250000, has_tenants: true)
p your_house.cost
