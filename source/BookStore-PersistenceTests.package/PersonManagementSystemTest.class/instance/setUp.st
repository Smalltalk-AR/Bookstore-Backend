initialization
setUp
	rootSystem := RootManagementSystem
		resolvingPersistenceWith: RDBPersistenceSystem start.
	personManagementSystem := PersonManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema