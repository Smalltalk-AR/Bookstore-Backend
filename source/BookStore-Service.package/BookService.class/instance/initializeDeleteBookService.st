initialization-service
initializeDeleteBookService
	server
		DELETE: (self fullPathUsing: '/books/<id>') -> [ :req | controller removeBookOfId: (req at: #id) ]