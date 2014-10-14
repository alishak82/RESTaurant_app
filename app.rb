require 'bundler'
Bundler.require


conn = PG::Connection.open()

conn.exec('CREATE DATABASE restaurant;')
conn.close

conn = PG::Connection.open(dbname: 'restaurant')
conn.exec('CREATE TABLE foods (id SERIAL PRIMARY KEY, name VARCHAR(100), cuisine VARCHAR(100), price INTEGER, description VARCHAR(255), allergens VARCHAR(100));')
conn.exec('CREATE TABLE parties (id SERIAL PRIMARY KEY, name VARCHAR(50), size INTEGER, table_number INTEGER, has_paid boolean;')
conn.exec('CREATE TABLE orders (id SERIAL PRIMARY KEY, parties_id INTEGER, foods_id INTEGER);')
conn.close



# --- Setup: Connection---
ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'restaurant'
  })


# GET: Displays links to navigate the application(including links to each current party)
get '/' do 	
end

# GET: Display a list of food items available
get '/foods' do 
end

# GET: Display a single food item and a list of all the parties that included it
get '/foods/:id' do
end

# GET: Display a form for a new food item
get '/foods/new' do
end

# CREATE/POST: Creates a new food item
post '/foods' do
end

# GET: Display a form to edit a food item
get '/foods/:id/edit' do
end

# UPDATE/PATCH: Updates a food item
patch '/foods/:id' do
end

# DESTROY: Deletes a food item
delete '/foods/:id' do
end

# GET: Displays a list of all parties
get '/parties' do
end

# GET: Display a single party and options for adding a food item to the party
get '/parties/:id' do
end

# GET: Display a form for a new party
get '/parties/new'
end

# CREATE/POST: Creates a new party
post '/parties' do
end

# GET: Display a form to edit a party's details
get '/parties/:id/edit' do
end

# UPDATE/PATCH: Updates a party's details
patch '/parties/:id' do
end

# DESTROY: Delete a party
delete '/parties/:id' do
end

# CREATE/POST: Create a new order
post '/orders' do
end

# UPDATE/PATCH: Change item to no-charge
patch '/orders/:id' do
end

# DESTROY: Delete/Remove an order
delete '/orders' do
end

# GET: Saves the party's receipt data to a file. Displays the content of the receipt. Offers the file for download.
get '/parties/:id/receipt' do
end

# UPDATE/PATCH: Marks that the party has paid
patch '/parties/:id/checkout' do
end
 



















