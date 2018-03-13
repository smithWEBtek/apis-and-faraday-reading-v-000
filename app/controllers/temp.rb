def cloudinary
			begin
			response = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
				req.params['client_id'] = ENV["FS_CLIENT_ID"]
				req.params['client_secret'] = ENV["FS_CLIENT_SECRET"]
				req.params['v'] = '20160201'
				req.params['near'] = params[:zipcode]
				req.params['query'] = params[:query]
				@req = req
				puts "---------------------------"
				puts '@req' + "#{@req}"
				puts "---------------------------"
			end
			body = JSON.parse(response.body) 
			if response.success?
				@venues = body["response"]["venues"]
			else
				@error = body["meta"]["errorDetail"]
			end
			
		rescue Faraday::TimeoutError
			@error = "There was a timeout. Please try again."
		end
		render 'search'
	end