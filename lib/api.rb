require 'net/http'

class Api
	attr_accessor :url
	attr_accessor :uri

	def initialize
		@url = "http://localhost:3000/reviews"
		@uri = URI.parse @url
	end

	# Create an employee using a predefined XML template as a REST request
	def create(id, member="Defaut member", rating="9", venue_Name="Default Venue_Name", address="Default Address", city="Default City", phone="9999999999" , date="" , comment= "Default Comment" )

		xml_req =		
			"<?xml version='1.0' encoding='UTF-8'?>
			<review>
				<Member>#{member}</Member>
				<Rating>#{rating}</Rating>
				<Venue-Name>#{venue_Name}</Venue-Name>
				<Address>#{address}</Address>
				<City>#{city}</City>
				<Phone>#{phone}</Phone>				
				<Date-of-Visit>date</Date-of-Visit>
				<Comment>#{comment}</Comment>					
			</review>"

		request = Net::HTTP::Post.new(@url)
		request.add_field "Content-Type","application/xml"
		request.body = xml_req

		http = Net::HTTP.new(@uri.host, @uri.port)
		response = http.request(request)

		response.body
	end

	# Read can get all reviews with no arguments or
	# get one review with one argument. For example:
	# api = Api.new
	# api.read 2 => one review
	# api.read => all reviews
	def read(id=nil)
		request = Net::HTTP.new(@uri.host, @uri.port)

		if id.nil?
			response = request.get("#{@uri.path}.xml")
		else
			response = request.get("#{uri.path}/#{id}.xml")
		end

		response.body
	end

	# Update an employee using a predefined XML template as a REST request.
	def update(id, member="Default member", rating="9", venue_Name="Default Venue_Name", address="Default Address", city="Default City", phone="9999999999" , date="" , comment= "Default Comment")
		xml_req =
		"<?xml version='1.0' encoding='UTF-8'?>
			<review>
				<Member>#{member}</Member>
				<Rating>#{rating}</Rating>
				<Venue-Name>#{venue_Name}</Venue-Name>
				<Address>#{address}</Address>
				<City>#{city}</City>
				<Phone>#{phone}</Phone>
				<Date-of-Visit>date</Date-of-Visit>
				<Comment>#{comment}</Comment>					
			</review>"

		request = Net::HTTP::Put.new("#{@url}/#{id}.xml")
		request.add_field "Content-Type", "application/xml"
		request.body = xml_req

		http = Net::HTTP.new(@uri.host, @uri.port)
		response = http.request(request)

		# no response body will be returned
		case response
		when Net::HTTPSuccess
			return "#{response.code} OK"
		else
			return "#{response.code} ERROR"
		end
	end

	# Delete an employee with an ID using HTTP Delete
	def delete(id)
		request = Net::HTTP::Delete.new("#{@url}/#{id}.xml")
		http = Net::HTTP.new(@uri.host, @uri.port)
		response = http.request(request)

		# no response body will be returned
		case response
		when Net::HTTPSuccess
			return "#{response.code} OK"
		else
			return "#{response.code} ERROR"
		end
	end
end