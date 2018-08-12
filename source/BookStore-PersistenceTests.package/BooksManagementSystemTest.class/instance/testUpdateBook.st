Tests
testUpdateBook
	| book anotherBook |
	self assert: booksManagementSystem getAll isEmpty.
	book := self bookWrittenBy: self person.
	anotherBook := self anotherBookWrittenBy: self person.
	booksManagementSystem add: book.
	booksManagementSystem updateById: book id with: anotherBook.
	self assertCollection: booksManagementSystem getAll hasSameElements: (Array with: anotherBook)