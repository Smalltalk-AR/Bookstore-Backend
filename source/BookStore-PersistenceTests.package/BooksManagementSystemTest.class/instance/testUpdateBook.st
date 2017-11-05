Tests
testUpdateBook
	| book anotherBook |
	self assert: booksManagementSystem getAll isEmpty.
	book := self book.
	anotherBook := self anotherBook.
	booksManagementSystem add: book.
	booksManagementSystem updateById: book id with: anotherBook.
	self assertCollection: booksManagementSystem getAll hasSameElements: (Array with: anotherBook)