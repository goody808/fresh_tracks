class Location < ActiveRecord::Base

attr_accessible :name 

validates :name, presence: true
	
	def update_coordinates
		self.latitude, self.longitude = self.lat_long(index: 1)
	end 

	# takes in a place and returns a list of addresses
	# without an option all address are returned 
	# with an option :order pass an integer to choose with address to return
	def addresses(options = {index: -1})
		@addresses = []
		@geocoder_results = Geocoder.searc	h(self.name)
		@geocoder_results.each do |i|
			@addresses.push i.address
		end
		if options[:index] == -1  
			@addresses
		else 
			@addresses[options[:index]]
		end
	end

	# Returns pair [lat,long] from place search
	def lat_long(options = {index: -1}) 
		@coordinates = []
		@geocoder_results = Geocoder.search(self.name)
		@geocoder_results.each do |i|
			@coordinates.push i.coordinates
		end
		if options[:index] == -1  
			@coordinates
		else 
			@coordinates[options[:index]]
		end
	end 

end
