class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  def initialize(requirements = {})
    @address = requirements[:address]
    @square_feet = requirements[:square_feet]
    @num_bedrooms = requirements[:num_bedrooms] || 3
    @num_baths = requirements[:num_baths] || 2
    @cost = requirements[:cost] || 320_000
    @down_payment =requirements[:down_payment] || 0.20
    @sold = requirements[:sold] || false
    @has_tenants = requirements[:has_tenants] || false
    @short_sale = false
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

blue_house = House.new(address: "62 Why Worry Lane, Woodside, CA 94062", square_feet: 3200, num_bedrooms: 3, num_baths: 2,
                      has_tenants: false, sold: false, cost: 500_000, down_payment: 0.20)
p blue_house