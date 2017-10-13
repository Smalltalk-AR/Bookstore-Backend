Actions
addBookFrom: jsonStringBook
	| jsonBook book result |
	jsonBook := NeoJSONObject fromString: jsonStringBook.
	book := Book fromJson: jsonBook.
	result := booksManagementSystem addBook: book.
	^ TeaResponse ok
		body: result;
		headers: self normalHeaders