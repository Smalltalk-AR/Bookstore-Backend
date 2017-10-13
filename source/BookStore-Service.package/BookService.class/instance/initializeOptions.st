initialization
initializeOptions
	server
		OPTIONS: (self fullPathUsing: '/books') -> controller booksOptions;
		OPTIONS: (self fullPathUsing: '/books/<id>') -> controller booksOptions