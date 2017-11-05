initialization
initializeDeployingOn: aTeapotServer at: aBasePath withApiPath: anApiPath delegatingTo: aController
	basePath := aBasePath.
	apiPath := anApiPath.
	server := aTeapotServer.
	controller := aController.
	self
		initializeCreateObjectService;
		initializeDeleteObjectService;
		initializeUpdateObjectService;
		initializeAllObjectsService;
		initializeOptions