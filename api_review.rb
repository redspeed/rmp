require './lib/api.rb'
require 'nokogiri'

# CRUD for users
# Method to list users
def list_reviews(api_object)
	puts "Current reviews:"
	doc = Nokogiri::XML.parse api_object.read
	members = doc.xpath('reviews/review/Member').collect { |e| e.text }
	puts members.join(", ")
	puts ""
end

api = Api.new
list_reviews(api)

# Create
puts "Creating review..."
api.create "Glen", 9,"Home", "29 Ririnui Place", "Tauranga", 027314 , 2012-02-22 , "Best steak ever" 
list_reviews(api)

# Read one and do nothing with it
api.read 1

# Read all and get valid IDs
doc = Nokogiri::XML.parse api.read
ids = doc.xpath('reviews/review/id').collect {|e| e.text }

# Update last record
puts "Updating last record ..."
api.update ids.last, "Glen", 9,"Home", "29 Ririnui Place", "Tauranga", 027314 , 2012-02-22 , "Best steak ever" 
list_reviews(api)

# Delete
puts "Deleting last record ..."
api.delete ids.last
list_reviews(api)