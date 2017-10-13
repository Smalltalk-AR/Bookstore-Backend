initialization-service
initializeCreateBookService
	server
		POST: (self fullPathUsing: '/books') -> [ :req | controller addBookFrom: req contents ]