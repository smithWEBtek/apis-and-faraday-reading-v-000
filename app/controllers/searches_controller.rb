class SearchesController < ApplicationController
	
	def search
	end
 
	def cloudinary
		begin
		# @resp = Faraday.get 'https://api.cloudinary.com/v1_1/smithwebtek/resources/image' do |req|
		# url = 'https://' + "#{ENV["API_KEY"]}:" + "#{ENV["API_SECRET"]}" + '@api.cloudinary.com/v1_1/smithwebtek/resources/image'

		url = 'https://777466575657829:g7KcOFtLuC_0ZK5HMKNl3c48AJI@api.cloudinary.com/v1_1/smithwebtek/resources/image?api_key=777466575657829&api_secret=g7KcOFtLuC_0ZK5HMKNl3c48AJI'
		# url = 'https://api.cloudinary.com/v1_1/smithwebtek/resources/image'
		@resp = Faraday.get url do |req|
			# req.params["cloud_name"] = 'smithwebtek'
			# req.params["api_key"] = ENV["API_KEY"]
			# req.params["api_secret"] = ENV["API_SECRET"]
		end
		body = JSON.parse(@resp.body) 
		binding.pry
		
		if @resp.success?
			@images = body["response"]["images"]
		else
			@error = body
		end
	
		rescue Faraday::TimeoutError
			@error = "There was a timeout. Please try again."
		end
		render 'search'
	end
end
