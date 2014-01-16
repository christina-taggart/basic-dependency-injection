class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  def initialize(details = {})
    @address = details.fetch(:address)
    @square_feet = details.fetch(:square_feet) {2000}
    @num_bedrooms = details.fetch(:num_bedrooms) {3}
    @num_baths = details.fetch(:num_baths) {2}
    @cost = details.fetch(:cost) {320000}
    @down_payment = details.fetch(:down_payment) {0.2}
    # @sold = details.fetch(:sold) { false }
    # @short_sale = details.fetch(:short_sale) {false}
    # @has_tenants = details.fetch(:has_tenants) {false}
  end

  def obscure_address
    @address.sub(/\A\d*/, '****')
  end

  # def buy!(money, good_credit)
  #   @sold = true if money >= down_payment && good_credit
  # end

  def down_payment
    @cost * @down_payment
  end

  def to_s
    "#{obscure_address} : #{square_feet} sq. ft., #{num_bedrooms} bed, #{num_baths} bath. $#{cost}"
  end
end

crib = House.new(:cost => 320000, :num_bedrooms => 2, :address => "14 Pine Lane", :num_baths => 2, :square_feet => 2000, :down_payment => 0.2)
p crib.to_s