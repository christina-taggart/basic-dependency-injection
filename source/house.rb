class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  def initialize(parameter = {})
    @address = parameter.fetch(:address)
    @square_feet = parameter.fetch(:square_feet)
    @num_bedrooms = parameter[:num_bedrooms] || 3
    @num_baths = parameter[:num_baths] || 2
    @cost = parameter[:cost] || 320_000
    @down_payment = parameter[:down_payment]  || 0.20
    @sold = parameter[:sold] || false
    @short_sale = parameter.fetch(:short_sale)
    @has_tenants = parameter[:has_tenants] || false
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

house = House.new({:address => "this place", :num_baths => 7, :square_feet =>  637436})
p house.to_s