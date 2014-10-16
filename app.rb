require 'bundler'
Bundler.require

require_relative 'models/food'
require_relative 'models/order'
require_relative 'models/party'

# --- Setup: Connection---
ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'restaurant'
  })


# GET: Displays links to navigate the application(including links to each current party)
get '/' do 	
	erb :index
end

# GET: Display a list of food items available
get '/foods' do 
	@foods = Food.all
	erb :'foods/index'
end

# GET: Display a form for a new food item
get '/foods/new' do
	erb :'foods/new'
end

# GET: Display a single food item and a list of all the parties that included it
get '/foods/:id' do
	@food = Food.find(params[:id])
	@foods_show_parties = @food.parties
	# @parties = @food.parties
	erb :'foods/show'
end

# CREATE/POST: Creates a new food item
post '/foods' do
	food = Food.create(params[:food])
	if food.valid?
	redirect '/foods'
	else @errors = food.errors.full_messages
	erb :'foods/new'
	end
end

# GET: Display a form to edit a food item
get '/foods/:id/edit' do
	@food = Food.find(params[:id])
	erb :'foods/edit'
end

# UPDATE/PATCH: Updates a food item
patch '/foods/:id' do
	food = Food.find(params[:id])
	food.update(params[:food])
	redirect "/foods/#{food.id}"
end

# DESTROY: Deletes a food item
delete '/foods/:id' do
	Food.delete(params[:id])
	redirect '/foods'
end

# GET: Displays a list of all parties
get '/parties' do
	@parties = Party.all
	erb :'parties/index'
end

# GET: Display a form for a new party
get '/parties/new' do
	erb :'parties/new'
end

# GET: Display a single party and options for adding a food item to the party
get '/parties/:id' do
	@foods = Food.all # ALL the food... on their bill or not
	@party = Party.find(params[:id])  # Which exact party are we looking at
	@orders = @party.orders # What has that table already ordered
	erb :'parties/show'
end

# CREATE/POST: Creates a new party
post '/parties' do
	party = Party.create(params[:party])
	redirect '/parties'
end

# GET: Display a form to edit a party's details
get '/parties/:id/edit' do
	@party = Party.find(params[:id])
	erb :'parties/edit'
end

# UPDATE/PATCH: Updates a party's details
patch '/parties/:id' do
	party = Party.find(params[:id])
	party.update(params[:party])
	redirect "/parties/#{party.id}"
end

# DESTROY: Delete a party
delete '/parties/:id' do
	Party.destroy(params[:id])
	redirect '/parties'
end

# CREATE/POST: Create a new order
post '/parties/:id/orders' do
	# party = Party.find(params[:parties_id])
	# food = Food.find(params[:foods_id])
	food = Food.find(params[:food_id])
	party = Party.find(params[:id])
	Order.create({food: food, party: party})

	redirect "/parties/#{party.id}"
end

# UPDATE/PATCH: Change item to no-charge
# patch '/orders/:id' do
# 	order = Order.find(params[:id])
# 	order.update(params[:party]) !!!!!!
# 	redirect '/orders/#{order.id}'
# end

# DESTROY: Delete/Remove an order
delete '/parties/:party_id/orders/:id' do
	Order.destroy(params[:id])
	redirect "/parties/#{params['party_id']}"
end

# GET: Saves the party's receipt data to a file. Displays the content of the receipt. Offers the file for download.
get '/parties/:id/receipt' do
  @party = Party.find(params[:id])
	@food = Food.find(params[:id])
	@party.foods 

	erb :'parties/receipt'
end


# UPDATE/PATCH: Marks that the party has paid
patch '/parties/:id/checkout' do
end
