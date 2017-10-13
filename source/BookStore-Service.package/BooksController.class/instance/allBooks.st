Actions
allBooks
	^ TeaResponse ok
		body: booksManagementSystem allBooks;
		headers: self normalHeaders