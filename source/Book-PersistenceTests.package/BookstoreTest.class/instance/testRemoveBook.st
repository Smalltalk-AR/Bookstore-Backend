Tests
testRemoveBook
	| book |
	self assert: bookstore  booksCount equals: 0.
	book := self book.
	bookstore addBook: book.
	self assert: bookstore booksCount equals: 1.
	bookstore removeBookById: book id.
	self assert: bookstore booksCount equals: 0