Initialization
initializeSystems
	rootSystem := RootManagementSystem resolvingPersistenceWith: RDBPersistenceSystem start.
	BooksManagementSystem toInstallOn: rootSystem.
	PersonManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema