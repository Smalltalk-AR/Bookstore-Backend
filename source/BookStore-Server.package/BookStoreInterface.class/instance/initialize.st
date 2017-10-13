Initialization
initialize
	GeneralPersistenceSystem start.
	booksController := BooksController new.
	self initializeServer.
	self initializeRoutes