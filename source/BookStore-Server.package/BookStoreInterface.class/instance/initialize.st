Initialization
initialize
	booksController := BooksController new.
	self initializeServer.
	self initializeRoutes