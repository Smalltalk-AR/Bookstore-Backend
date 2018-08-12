Tests
testRemoveBook
	| book |
	self assert: booksManagementSystem getAll isEmpty.
	book := self  bookWrittenBy: self person.
	booksManagementSystem add: book.
	self assertCollection: booksManagementSystem getAll hasSameElements: (Array with: book).
	booksManagementSystem removeById: book id.
	self assert: booksManagementSystem getAll isEmpty