initialization
setUp
	persistenceSystem := RDBPersistenceSystem start.
	rootSystem := RootManagementSystem resolvingPersistenceWith: persistenceSystem.
	BooksManagementSystem  toInstallOn: rootSystem.
	personManagementSystem := PersonManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema