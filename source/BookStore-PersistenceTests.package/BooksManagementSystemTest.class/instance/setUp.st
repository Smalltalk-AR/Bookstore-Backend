Initialization
setUp
	rootSystem := RootManagementSystem resolvingPersistenceWith: RDBPersistenceSystem start.
	booksManagementSystem := BooksManagementSystem toInstallOn: rootSystem.
	PersonManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema