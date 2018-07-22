initialization
setUp
	rootSystem := RootManagementSystem resolvingPersistenceWith: RDBPersistenceSystem start.
	booksManagemenrSystem :=BooksManagementSystem toInstallOn: rootSystem.
	personManagementSystem := PersonManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema