class Grid

	def initialize

		@vStreetNames = {}

		@vStreetNames["0"] = "Spencer St"
		@vStreetNames["2"] = "King St"
		@vStreetNames["4"] = "William St"
		@vStreetNames["6"] = "Queen St"
		@vStreetNames["8"] = "Elizabeth St"
		@vStreetNames["10"] = "Swanston St"
		@vStreetNames["12"] = "Russell St"
		@vStreetNames["14"] = "Exhibition St"
		@vStreetNames["16"] = "Spring St"

		@hStreetNames = {}
		@hStreetNames["0"] = "Flinders St"
		@hStreetNames["2"] = "Flinders Ln"
		@hStreetNames["4"] = "Collins St"
		@hStreetNames["6"] = "Lt Collins St"
		@hStreetNames["8"] = "Bourke St"
		@hStreetNames["10"] = "Lt Bourke St"
		@hStreetNames["12"] = "Lonsdale St"
		@hStreetNames["14"] = "Lt Lonsdale St"
		@hStreetNames["16"] = "Latrobe St"

	end

	def getStreet(x, y)
		"#{@hStreetNames[y.to_s]} x #{@vStreetNames[x.to_s]}"
	end
end