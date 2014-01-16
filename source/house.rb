class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  def initialize(features = {})
    @address = features.fetch(:address)
    @square_feet = features.fetch(:square_feet) {4000}
    @num_bedrooms = features.fetch(:num_bedrooms) {3}
    @num_baths = features.fetch(:num_baths) {2}
    @cost = features.fetch(:cost) {320_000}
    @down_payment = features.fetch(:down_payment) {0.2}
    @sold = features.fetch(:sold) {false}
    @short_sale = features.fetch(:short_sale) {false}
    @has_tenants = features.fetch(:has_tenants) {false}

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