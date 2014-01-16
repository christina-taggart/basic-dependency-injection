class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  def initialize(options = {})
    @address = options.fetch(:address)
    @square_feet = options.fetch(:square_feet) {1200}
    @num_bedrooms = options.fetch(:num_bedrooms) {3}
    @num_baths = options.fetch(:num_baths) {2}
    @cost = options.fetch(:cost) {320000}
    @down_payment = options.fetch(:down_payment) {0.20}
    @sold = options.fetch(:sold) {false}
    @short_sale = options.fetch(:short_sale) {true}
    @has_tenants = options.fetch(:has_tenants) {false}
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

house = House.new({address: "111 Plum Street"})
p house.square_feet
p house.num_baths
p house.num_bedrooms
p house.cost
p house.to_s