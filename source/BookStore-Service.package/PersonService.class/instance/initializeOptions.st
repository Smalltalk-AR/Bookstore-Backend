Initialization-Service
initializeOptions
	server
		OPTIONS: (self fullPathUsing: '/persons') -> controller personsOptions;
		OPTIONS: (self fullPathUsing: '/persons/<id>') -> controller personsOptions