initialization-service
initializeAllBookService
	server GET: (self fullPathUsing: '/books') -> [ :req |controller allBooks]