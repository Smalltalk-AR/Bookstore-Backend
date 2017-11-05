initialization-service
initializeDeleteObjectService
	server DELETE: (self fullPath,'/<id>') -> [ :req | controller removeById: (req at: #id) ]