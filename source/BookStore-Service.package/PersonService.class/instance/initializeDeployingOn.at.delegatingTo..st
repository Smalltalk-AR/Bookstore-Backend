Initialization
initializeDeployingOn: aTeapotServer at: aBasePath delegatingTo: aController
	basePath := aBasePath .
	server := aTeapotServer.
	controller := aController.
	self
		initializeCreatePersonService;
		initializeDeletePersonService;
		initializeUpdatePersonService;
		initializeAllPersonsService;
		initializeOptions