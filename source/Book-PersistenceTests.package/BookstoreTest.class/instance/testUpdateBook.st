Tests
testUpdateBook
	| book anotherBook bookFromDatabase |
	self assert: booksManagementSystem booksCount equals: 0.
	book := self book.
	anotherBook := self anotherBook.
	booksManagementSystem addBook: book.
	booksManagementSystem updateBookOfId: book id with: anotherBook.
	self assert: booksManagementSystem booksCount equals: 1.
	bookFromDatabase := booksManagementSystem allBooks anyOne.
	self assert: bookFromDatabase equals: anotherBook