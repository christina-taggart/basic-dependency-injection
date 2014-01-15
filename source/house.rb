class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  def initialize(house_info = {})
    @address = house_info.fetch(:address)             {'1234'}
    @square_feet = house_info.fetch(:square_feet)     {"Not Given"}
    @num_bedrooms = house_info.fetch(:num_bedrooms)   {3}
    @num_baths = house_info.fetch(:num_baths)         {2}
    @cost = house_info.fetch(:cost)                   {320_000}
    @down_payment = house_info.fetch(:down_payment)   {0.20}
    @sold = house_info.fetch(:sold)                   {false}
    @short_sale = house_info.fetch(:short_sale)       {"Not Given"}
    @has_tenants = house_info.fetch(:has_tenants)     {false}
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

house = House.new({square_feet: 1000, cost: 100_000})
p house.num_bedrooms
