class Cloud
	include HTTParty
	api_key = ENV["API_KEY"]
	api_secret = ENV["API_SECRET"]
	# base_uri = "#{api_key}:#{api_secret}@" + 'api.cloudinary.com/'
	base_uri = 'api.cloudinary.com'



	def inititalize(action, type)
		@options = { query: {site: service}}
	end

	def images
		self.class.get('v1_1/smithwebtek/', @options)
	end
end

# cloud = Cloud.new("resources", "image")
cloud = Cloud.new
puts cloud.images