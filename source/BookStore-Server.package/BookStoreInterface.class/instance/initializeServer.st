Initialization
initializeServer
	server := Teapot
		configure:
			{(#defaultOutput -> #json).
			(#port -> 1710).
			(#debugMode -> true).
			(#bindAddress -> #[127 0 0 1])}