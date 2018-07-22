Tests
testRemovePersonHavingABookNotPossibleBecauseOfForeignKey
	| person |
	person := self somePersonToModify.
	self assert: personManagementSystem getAll isEmpty.
	person addBook: self book.
	personManagementSystem add: person.
	self assert: personManagementSystem count equals: 1.
	self should: [personManagementSystem remove: person] raise: GlorpDatabaseWriteError .