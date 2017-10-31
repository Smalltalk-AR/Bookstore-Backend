Test Support
setUpSystems
	rootSystem := RootManagementSystem
		resolvingPersistenceWith: GeneralPersistenceSystem start.
	BooksManagementSystem toInstallOn: rootSystem.
	PersonManagementSystem toInstallOn: rootSystem.
	authorshipManagementSystem := AuthorshipManagementSystem toInstallOn: rootSystem