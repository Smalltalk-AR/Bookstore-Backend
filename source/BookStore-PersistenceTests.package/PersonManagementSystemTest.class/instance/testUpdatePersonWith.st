Tests
testUpdatePersonWith
	| somePerson anUpdatedPerson personFromDatabase |
	somePerson := self somePerson.
	anUpdatedPerson := self anotherPerson.
	personManagementSystem addPerson: somePerson.
	personManagementSystem updatePerson: somePerson with: anUpdatedPerson.
	self assert: personManagementSystem personsCount equals: 1.
	personFromDatabase := personManagementSystem allPersons anyOne.
	self assert: personFromDatabase equals: anUpdatedPerson