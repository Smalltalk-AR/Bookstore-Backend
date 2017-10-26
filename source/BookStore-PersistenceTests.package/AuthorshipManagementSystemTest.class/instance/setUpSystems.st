tests
setUpSystems
	persistenceSystem := GeneralPersistenceSystem start.
	booksManagementSystem := BooksManagementSystem
		using: persistenceSystem.
	personManagementSystem := PersonManagementSystem
		using: persistenceSystem.
	authorshipManagementSystem := AuthorshipManagementSystem
		using: persistenceSystem