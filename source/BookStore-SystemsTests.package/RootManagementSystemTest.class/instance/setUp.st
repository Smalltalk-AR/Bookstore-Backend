initialization
setUp
	persistenceSystem := RDBPersistenceSystem start.
	rootSystem := RootManagementSystem resolvingPersistenceWith: persistenceSystem.
	personManagementSystem := PersonManagementSystem toInstallOn: rootSystem.
	rootSystem persistenceSystem dropAllThenCreateSchema