Initialization
initializeRoutes
	BookService deployingOn: server delegatingTo: (BooksController workingOn: rootSystem).
	PersonService deployingOn: server delegatingTo: (PersonsController workingOn: rootSystem).
	