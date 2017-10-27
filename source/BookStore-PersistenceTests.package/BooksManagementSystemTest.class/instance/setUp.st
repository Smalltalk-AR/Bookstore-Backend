Initialization
setUp
	rootSystem := RootManagementSystem
		resolvingPersistenceWith: GeneralPersistenceSystem start.
	booksManagementSystem := BooksManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema