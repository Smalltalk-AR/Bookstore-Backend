Tests
testRemovePersonById
	self assert: personManagementSystem getAll isEmpty.
	personManagementSystem add: self somePerson.
	self assert: personManagementSystem count equals: 1.
	personManagementSystem removeById: personManagementSystem getAll anyOne id.
	self assert: personManagementSystem getAll isEmpty.