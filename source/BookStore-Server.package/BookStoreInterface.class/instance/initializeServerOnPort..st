Initialization
initializeServerOnPort: number
	server := Teapot
		configure:
			{(#defaultOutput -> #json).
			(#port -> number).
			(#debugMode -> true).
			(#bindAddress -> #[127 0 0 1])}