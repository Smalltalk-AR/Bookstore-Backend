Tests
testRemoveBook
	| book |
	self assert: booksManagementSystem  booksCount equals: 0.
	book := self book.
	booksManagementSystem addBook: book.
	self assert: booksManagementSystem booksCount equals: 1.
	booksManagementSystem removeBookOfId: book id.
	self assert: booksManagementSystem booksCount equals: 0