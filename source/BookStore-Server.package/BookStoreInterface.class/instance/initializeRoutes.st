Initialization
initializeRoutes
	GenericService deployingOn: server at: '' withApiPath: 'books' delegatingTo: (GenericController workingOn: rootSystem managing: Book).
	GenericService deployingOn: server at: '' withApiPath: 'persons' delegatingTo: (GenericController workingOn: rootSystem managing: Person).
	