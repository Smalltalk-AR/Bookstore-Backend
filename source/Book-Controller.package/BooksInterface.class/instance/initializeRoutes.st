Initialization
initializeRoutes
	server
		GET: '/books' -> booksController allBooks;
		POST: '/books' -> [ :req | booksController addBookFrom: req contents ];
		DELETE: '/books/<id>' -> [ :req | booksController removeBookOfId: (req at: #id) ];
		PUT:
			'/books/<id>'
				-> [ :req | booksController updateBookOfId: (req at: #id) withBookFrom: req contents ];
		OPTIONS: '/books' -> booksController booksOptions;
		OPTIONS: '/books/<id>' -> booksController booksOptions