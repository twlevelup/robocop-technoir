class Grid
	def initialize(x, y)
		@x = x
		@y = y

		@vStreetNames = {}

		@vStreetNames["0"] = "Spencer St"
		@vStreetNames["1"] = "King St"
		@vStreetNames["2"] = "William St"
		@vStreetNames["3"] = "Queen St"
		@vStreetNames["4"] = "Elizabeth St"
		@vStreetNames["5"] = "Swanston St"
		@vStreetNames["6"] = "Russell St"
		@vStreetNames["7"] = "Spring St"

		@hStreetNames = {}
		@hStreetNames["0"] = "Flinders St"
		@hStreetNames["1"] = "Little Flinders St"
		@hStreetNames["2"] = "Collins St"
		@hStreetNames["3"] = "Lt Collins St"
		@hStreetNames["4"] = "Burke St"
		@hStreetNames["5"] = "Lt Burke St"
		@hStreetNames["6"] = "Lonsdale St"
		@hStreetNames["7"] = "Latrobe St"

	end

	def getStreet(x, y)
		"#{@hStreetNames[y.to_s]} x #{@vStreetNames[x.to_s]}"
	end
end