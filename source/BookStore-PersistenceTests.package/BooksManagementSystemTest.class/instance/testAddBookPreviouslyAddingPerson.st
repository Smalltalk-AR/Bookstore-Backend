Tests
testAddBookPreviouslyAddingPerson
	| book person|
	self assert: booksManagementSystem getAll isEmpty.
	person := self person.
	person := personsManagementSystem add: person.
	book := self bookWrittenBy:  person.
	booksManagementSystem add: book.
	self assertCollection: booksManagementSystem getAll hasSameElements: (Array with: book)