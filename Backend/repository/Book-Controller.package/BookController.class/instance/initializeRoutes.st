Initialization
initializeRoutes
	server
		GET:
			'/books'
				-> [ :req | 
					TeaResponse ok
						body: bookShop allBooks;
						headers: {('Access-Control-Allow-Origin' -> '*')} ];
		OPTIONS:
			'/newBook'
				->
					(TeaResponse ok
						headers:
							{('Content-Type' -> 'application/json').
							('Accept' -> 'application/json').
							('Access-Control-Allow-Methods' -> 'POST, GET, OPTIONS, DELETE, PUT').
							('Access-Control-Allow-Origin' -> 'http://localhost:8081').
							('Access-Control-Allow-Headers'
								-> 'X-Requested-With, Content-Type, Origin, Authorization, Accept, Client-Security-Token, Accept-Encoding')});
		POST:
			'/newBook'
				-> [ :req | 
					| json book |
					json := NeoJSONObject fromString: req contents.
					book := self bookFromJsonObject: json.
					bookShop addBook: book.
					TeaResponse ok
						body: 'Se agrego correctamente el Libro';
						headers: {('Access-Control-Allow-Origin' -> '*')} ];
		OPTIONS:
			'/deleteBook'
				->
					(TeaResponse ok
						headers:
							{('Content-Type' -> 'application/json').
							('Accept' -> 'application/json').
							('Access-Control-Allow-Methods' -> 'POST, GET, OPTIONS, DELETE, PUT').
							('Access-Control-Allow-Origin' -> 'http://localhost:8081').
							('Access-Control-Allow-Headers'
								-> 'X-Requested-With, Content-Type, Origin, Authorization, Accept, Client-Security-Token, Accept-Encoding')});
		POST:
			'/deleteBook'
				-> [ :req | 
					| json book |
					json := NeoJSONObject fromString: req contents.
					book := self bookFromJsonObject: json.
					[ bookShop removeBook: book.
					TeaResponse ok
						body: 'Se elimino correctamente el Libro';
						headers: {('Access-Control-Allow-Origin' -> '*')} ]
						on: Error
						do: [ TeaResponse badRequest
								body: 'No se encontro el libro que desea borrar';
								headers: {('Access-Control-Allow-Origin' -> '*')} ] ];
		OPTIONS:
			'/editBook'
				->
					(TeaResponse ok
						headers:
							{('Content-Type' -> 'application/json').
							('Accept' -> 'application/json').
							('Access-Control-Allow-Methods' -> 'POST, GET, OPTIONS, DELETE, PUT').
							('Access-Control-Allow-Origin' -> 'http://localhost:8081').
							('Access-Control-Allow-Headers'
								-> 'X-Requested-With, Content-Type, Origin, Authorization, Accept, Client-Security-Token, Accept-Encoding')});
		POST:
			'/editBook'
				-> [ :req | 
					| json oldBook newBook |
					json := NeoJSONObject fromString: req contents.
					oldBook := self bookFromJsonObject: (json at: #oldBook).
					newBook := self bookFromJsonObject: (json at: #newBook).
					[ bookShop updateBook: oldBook from: newBook.
					TeaResponse ok
						body: 'Se agrego actualizo el Libro';
						headers: {('Access-Control-Allow-Origin' -> '*')} ]
						on: Error
						do: [ TeaResponse badRequest
								body: 'Hubo un problema al editar el libro';
								headers: {('Access-Control-Allow-Origin' -> '*')} ] ];
		output: #json