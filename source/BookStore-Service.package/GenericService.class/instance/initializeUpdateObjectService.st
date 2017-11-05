initialization-service
initializeUpdateObjectService
	server
		PUT: (self fullPath , '/<id>') -> [ :req | controller updateObjectWithId: (req at: #id) withObjectBasedOn: req contents ]