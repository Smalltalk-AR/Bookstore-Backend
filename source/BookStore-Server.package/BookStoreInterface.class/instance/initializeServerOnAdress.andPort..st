Initialization
initializeServerOnAdress: adressByteArray andPort: number
	server := Teapot
		configure:
			{(#defaultOutput -> #json).
			(#port -> number).
			(#debugMode -> true).
			(#bindAddress -> adressByteArray)}