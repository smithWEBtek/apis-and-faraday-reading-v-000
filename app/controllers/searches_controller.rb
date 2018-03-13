class SearchesController < ApplicationController
	
	def search
	end
	
	def cloudinary
		#  curl https://777466575657829:g7KcOFtLuC_0ZK5HMKNl3c48AJI@api.cloudinary.com/v1_1/smithwebtek/resources/image
		
		# api_key = ENV["API_KEY"]
		# api_secret = ENV["API_SECRET"]
		
		# puts "--------------------------------------"
		# puts "the URL: " + "#{url}"
		# puts "--------------------------------------"
		
		url = 'https://' + "#{ENV["API_KEY"]}:" + "#{ENV["API_SECRET"]}" + '@api.cloudinary.com/v1_1/smithwebtek/resources/search'

	def foursquare
		begin
			# @resp = Faraday.get 'https://api.cloudinary.com/v1_1/smithwebtek/resources/image' do |req|
			@resp = Faraday.get url do |req|
				req.params["cloud_name"] = 'smithwebtek'
				req.params["api_key"] = ENV["API_KEY"]
				req.params["api_secret"] = ENV["API_SECRET"]
			end
			body = JSON.parse(@resp.body) 
			binding.pry
		end
		
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
