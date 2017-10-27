Initialization-Service
initializeCreatePersonService
	server POST: (self fullPathUsing: '/persons') -> [ :req | controller addPersonFrom: req contents ]