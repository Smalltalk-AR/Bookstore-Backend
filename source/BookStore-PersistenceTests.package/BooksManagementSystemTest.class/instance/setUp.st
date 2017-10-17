Initialization
setUp
	persistenceSystem := GeneralPersistenceSystem start.
	booksManagementSystem  := BooksManagementSystem using: persistenceSystem .
	persistenceSystem dropAllThenCreateSchema.