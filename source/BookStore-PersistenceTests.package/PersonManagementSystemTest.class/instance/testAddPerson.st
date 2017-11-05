Tests
testAddPerson
	| person |
	self assert: personManagementSystem getAll isEmpty.
	person := self somePerson.
	personManagementSystem add: person.
	self assertCollection: personManagementSystem getAll hasSameElements: (Array with: person)