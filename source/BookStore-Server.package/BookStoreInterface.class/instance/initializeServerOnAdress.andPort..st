Initialization
initializeServerOnAdress: adressByteArray andPort: aPortNumber
	server := Teapot
		configure:
			{(#defaultOutput -> #json).
			(#port -> aPortNumber).
			(#debugMode -> true).
			(#bindAddress -> adressByteArray)}