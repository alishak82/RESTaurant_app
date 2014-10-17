class Party < ActiveRecord::Base
	has_many(:orders)
	has_many(:foods, :through => :orders)
end

# def receipt
# 	File.open(, 'w') { |file| file.write("your text") }
# end
