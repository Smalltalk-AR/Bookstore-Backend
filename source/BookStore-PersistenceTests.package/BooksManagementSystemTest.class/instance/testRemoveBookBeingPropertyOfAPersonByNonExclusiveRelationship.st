Tests
testRemoveBookBeingPropertyOfAPersonByNonExclusiveRelationship
	| book person persons |
	
	person := self person.
	book := self bookWrittenBy: person.
	personsManagementSystem add: person.
	booksManagementSystem add: book.
	
	booksManagementSystem removeById: book id.
	
	persons := personsManagementSystem getAll.
	self assert: booksManagementSystem getAll isEmpty.
	self assertCollection: persons hasSameElements: (Array with: person)