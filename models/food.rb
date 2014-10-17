class Food < ActiveRecord::Base
	has_many(:orders)
	has_many(:parties, :through => :orders)

	validates :name, :price, :description, presence: true
	validates :name, uniqueness: true

	# def initialize(name, price, description)
	# end

# 	def cant_order
# 		if @party.has_paid = true
# 			raise ThisPartyHasAlreadyPaidError, "This party has already paid and can no longer order additional food items."
# 		end 
# 	end

end

