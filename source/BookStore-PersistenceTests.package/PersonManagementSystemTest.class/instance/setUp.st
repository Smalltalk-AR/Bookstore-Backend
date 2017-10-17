initialization
setUp
	persistenceSystem := GeneralPersistenceSystem start.
	personManagementSystem  := PersonManagementSystem using: persistenceSystem .
	persistenceSystem dropAllThenCreateSchema.