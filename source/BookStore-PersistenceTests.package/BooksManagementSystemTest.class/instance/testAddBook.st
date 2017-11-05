Tests
testAddBook
	| book |
	self assert: booksManagementSystem getAll isEmpty.
	book := self book.
	booksManagementSystem add: book.
	self assertCollection: booksManagementSystem getAll hasSameElements: (Array with: book)