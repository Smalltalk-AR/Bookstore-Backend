initialization
setUp
	rootSystem := RootManagementSystem resolvingPersistenceWith: RDBPersistenceSystem start.
	BooksManagementSystem toInstallOn: rootSystem.
	personManagementSystem := PersonManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema