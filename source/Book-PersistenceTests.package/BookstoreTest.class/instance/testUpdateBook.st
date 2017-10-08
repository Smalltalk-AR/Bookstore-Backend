Tests
testUpdateBook
	| book anotherBook bookFromDatabase |
	self assert: bookstore booksCount equals: 0.
	book := self book.
	anotherBook := self anotherBook.
	bookstore addBook: book.
	bookstore updateBookOfId: book id with: anotherBook.
	self assert: bookstore booksCount equals: 1.
	bookFromDatabase := bookstore allBooks anyOne.
	self assert: bookFromDatabase equals: anotherBook