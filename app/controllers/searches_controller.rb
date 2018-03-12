class SearchesController < ApplicationController
	
	def search
 
  end


	
	def cloudinary
		# url = 'https://' + "#{ENV["API_KEY"]}" + ':' + "#{ENV["API_SECRET"]}" + '@api.cloudinary.com/v1_1/smithwebtek/resources'
		# url = 'https://api.cloudinary.com/v1_1/smithwebtek/resources/image'
		# url = 'https://api.cloudinary.com/v1_1/demo/resources/images'
		# url = 'https://777466575657829:g7KcOFtLuC_0ZK5HMKNl3c48AJI@api.cloudinary.com/v1_1/smithwebtek/resources/image'
		url = 'https://api.cloudinary.com/v1_1/smithwebtek/resources/image'

		api_key = ENV["API_KEY"]
		api_secret = ENV["API_SECRET"]

		begin
			resp = Faraday.get url do |req|
				req.params['api_key'] = api_key
				req.params['api_secret'] = api_secret
				@req = req
			end
			body = JSON.parse(resp.body) 
			
	binding.pry

		if resp.success?
			@images = body["response"]["images"]
		else
			@error = body["meta"]["errorDetail"]
		end
		
		rescue Faraday::TimeoutError
			@error = "There was a timeout. Please try again."
		end
		render 'search'
	end
end
