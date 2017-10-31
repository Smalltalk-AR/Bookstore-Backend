Initialization
initializeSystems
	rootSystem := RootManagementSystem
		resolvingPersistenceWith: GeneralPersistenceSystem start.
	BooksManagementSystem toInstallOn: rootSystem.
	PersonManagementSystem toInstallOn: rootSystem.
	AuthorshipManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema.
	