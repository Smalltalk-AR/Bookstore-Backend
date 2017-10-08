Tests
testAddBook
	| book bookFromDatabase |
	self assert: bookstore  booksCount equals: 0.
	book := self book.
	bookstore addBook: book.
	self assert: bookstore booksCount equals: 1.
	bookFromDatabase := bookstore allBooks anyOne.
	self assert: bookFromDatabase equals: book