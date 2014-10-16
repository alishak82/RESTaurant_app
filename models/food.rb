class Food < ActiveRecord::Base
	has_many(:orders)
	has_many(:parties, :through => :orders)

	validates :name, :price, :description, presence: true
	validates :name, uniqueness: true
end

