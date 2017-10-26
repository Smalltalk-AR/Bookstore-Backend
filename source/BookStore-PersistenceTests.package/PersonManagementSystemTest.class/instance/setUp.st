initialization
setUp
	persistenceSystem := GeneralPersistenceSystem start.
	BooksManagementSystem using: persistenceSystem.
	personManagementSystem  := PersonManagementSystem using: persistenceSystem .
	persistenceSystem dropAllThenCreateSchema.