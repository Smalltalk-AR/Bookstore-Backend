Initialization
setUp
	rootSystem := RootManagementSystem
		resolvingPersistenceWith: RDBPersistenceSystem start.
	booksManagementSystem := BooksManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema