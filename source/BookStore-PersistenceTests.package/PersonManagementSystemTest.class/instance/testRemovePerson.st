Tests
testRemovePerson
	self assert: personManagementSystem personsCount equals: 0.
	personManagementSystem addPerson: self somePerson.
	self assert: personManagementSystem personsCount equals: 1.
	personManagementSystem remove: personManagementSystem allPersons anyOne.
	self assert: personManagementSystem personsCount equals: 0