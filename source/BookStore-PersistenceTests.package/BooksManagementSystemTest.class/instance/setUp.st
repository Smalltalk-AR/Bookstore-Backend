Initialization
setUp
	rootSystem := RootManagementSystem resolvingPersistenceWith: RDBPersistenceSystem start.
	booksManagementSystem := BooksManagementSystem toInstallOn: rootSystem.
	personsManagementSystem :=PersonManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema