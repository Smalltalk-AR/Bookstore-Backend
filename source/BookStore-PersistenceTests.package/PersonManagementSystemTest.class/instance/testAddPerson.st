Tests
testAddPerson
	| person personFromDatabase |
	self assert: personManagementSystem personsCount equals: 0.
	person := self somePerson.
	personManagementSystem addPerson: person.
	self assert: personManagementSystem personsCount equals: 1.
	personFromDatabase := personManagementSystem allPersons anyOne.
	self assert: personFromDatabase equals: person