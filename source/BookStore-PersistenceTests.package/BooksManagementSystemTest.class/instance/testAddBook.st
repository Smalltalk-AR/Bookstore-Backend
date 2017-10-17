Tests
testAddBook
	| book bookFromDatabase |
	self assert: booksManagementSystem  booksCount equals: 0.
	book := self book.
	booksManagementSystem addBook: book.
	self assert: booksManagementSystem booksCount equals: 1.
	bookFromDatabase := booksManagementSystem allBooks anyOne.
	self assert: bookFromDatabase equals: book