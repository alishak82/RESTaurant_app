class PartyHasntPaid < ActiveModel::Validator
	def validate(order)
		if order.party.has_paid 
			order.errors[:base] << "This party has already paid."
		end
	end
end

class Order < ActiveRecord::Base
	belongs_to(:food)
	belongs_to(:party)

	validates_with PartyHasntPaid
end