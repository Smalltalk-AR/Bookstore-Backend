Tests
testRemoveBookBeingPropertyOfAPersonByNonExclusiveRelationship
	| book person persons |
	
	person := self person.
	book := self book.
	person addBook: book.
	booksManagementSystem add: book.
	personsManagementSystem add: person.
	booksManagementSystem removeById: book id.
	
	persons := personsManagementSystem getAll.
	self assert: booksManagementSystem getAll isEmpty.
	self assertCollection: persons hasSameElements: (Array with: person)