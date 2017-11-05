Test Support
setUpSystems
	rootSystem := RootManagementSystem
		resolvingPersistenceWith: RDBPersistenceSystem start.
	BooksManagementSystem toInstallOn: rootSystem.
	PersonManagementSystem toInstallOn: rootSystem.
	authorshipManagementSystem := AuthorshipManagementSystem toInstallOn: rootSystem