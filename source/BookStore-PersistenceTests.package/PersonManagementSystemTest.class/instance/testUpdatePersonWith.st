Tests
testUpdatePersonWith
	| somePerson anUpdatedPerson personFromDatabase |
	somePerson := self somePerson.
	anUpdatedPerson := self anotherPerson.
	personManagementSystem add: somePerson.
	personManagementSystem update: somePerson with: anUpdatedPerson.
	self assert: personManagementSystem count equals: 1.
	personFromDatabase := personManagementSystem getAll anyOne.
	self assert: personFromDatabase equals: anUpdatedPerson