Initialization-Service
initializeDeletePersonService
	server
		DELETE: (self fullPathUsing: '/persons/<id>') -> [ :req | controller removePersonOfId: (req at: #id) ]