Tests
testRemovePerson
	self assert: personManagementSystem getAll isEmpty.
	personManagementSystem add: self somePerson.
	self assert: personManagementSystem count equals: 1.
	personManagementSystem remove: personManagementSystem getAll anyOne.
	self assert: personManagementSystem getAll isEmpty 