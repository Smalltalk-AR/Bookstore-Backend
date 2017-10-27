initialization
setUp
	rootSystem := RootManagementSystem
		resolvingPersistenceWith: GeneralPersistenceSystem start.
	personManagementSystem := PersonManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema