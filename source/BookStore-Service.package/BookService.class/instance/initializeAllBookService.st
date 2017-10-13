initialization-service
initializeAllBookService
	server GET: (self fullPathUsing: '/books') -> controller allBooks