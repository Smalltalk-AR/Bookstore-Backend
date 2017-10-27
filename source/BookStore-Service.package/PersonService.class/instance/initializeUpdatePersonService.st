Initialization-Service
initializeUpdatePersonService
	server PUT: (self fullPathUsing: '/persons/<id>') -> [ :req | controller updatePersonOfId: (req at: #id) withPersonFrom: req contents ]