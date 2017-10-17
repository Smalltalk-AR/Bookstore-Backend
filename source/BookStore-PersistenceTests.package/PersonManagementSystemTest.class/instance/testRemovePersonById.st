Tests
testRemovePersonById
	self assert: personManagementSystem personsCount equals: 0.
	personManagementSystem addPerson: self somePerson.
	self assert: personManagementSystem personsCount equals: 1.
	personManagementSystem removePersonWithId: personManagementSystem allPersons anyOne id.
	self assert: personManagementSystem personsCount equals: 0