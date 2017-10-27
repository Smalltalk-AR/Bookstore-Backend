initialization
setUp
	persistenceSystem := GeneralPersistenceSystem start.
	rootSystem := RootManagementSystem resolvingPersistenceWith: persistenceSystem.
	personManagementSystem := PersonManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema