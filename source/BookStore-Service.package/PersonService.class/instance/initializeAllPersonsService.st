Initialization-Service
initializeAllPersonsService
	server GET: (self fullPathUsing: '/persons') -> [ :req | controller allPersons ]