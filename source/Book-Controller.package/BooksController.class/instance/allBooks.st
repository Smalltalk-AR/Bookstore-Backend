Actions
allBooks
	^ TeaResponse ok
		body: bookShop allBooks;
		headers: self normalHeaders