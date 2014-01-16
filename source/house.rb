class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost


  def initialize(house_components = {:num_bedrooms => 3, :num_baths => 2, :cost => 320_000, :down_payment => 0.20, :sold => false, :has_tenants => false})
    @address = house_components[:address]
    @square_feet = house_components[:square_feet]
    @num_bedrooms = house_components[:num_bedrooms]
    @num_baths = house_components[:num_baths]
    @cost = house_components[:cost]
    @down_payment = house_components[:down_payment]
    @sold = house_components[:sold]
    @short_sale = house_components[:short_sale]
    @has_tenants = house_components[:has_tenants]
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
