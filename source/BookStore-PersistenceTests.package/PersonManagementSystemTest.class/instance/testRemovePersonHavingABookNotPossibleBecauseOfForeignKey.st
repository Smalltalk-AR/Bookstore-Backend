Tests
testRemovePersonHavingABookNotPossibleBecauseOfForeignKey
	| book person |

	person := self somePerson.
	book := self bookWrittenBy: person.
	booksManagemenrSystem add: book.
	personManagementSystem add: person.
	self should: [personManagementSystem removeById: person id] raise: GlorpDatabaseWriteError	