initialization-service
initializeUpdateBookService
	server
		PUT:
			(self fullPathUsing: '/books/<id>')
				-> [ :req | controller updateBookOfId: (req at: #id) withBookFrom: req contents ]