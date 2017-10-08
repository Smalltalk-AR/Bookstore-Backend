Actions
updateBookOfId: anId withBookFrom: jsonStringBook
	| jsonBook book result |
	jsonBook := NeoJSONObject fromString: jsonStringBook.
	book := self bookFromJsonObject: jsonBook.
	result := booksManagementSystem updateBookOfId: anId with: book.
	^ TeaResponse ok
		body: result;
		headers: self normalHeaders