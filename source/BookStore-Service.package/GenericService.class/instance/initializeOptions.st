initialization-service
initializeOptions
	server
		OPTIONS: (self fullPath) -> controller options;
		OPTIONS: (self fullPath , '/<id>') -> controller options