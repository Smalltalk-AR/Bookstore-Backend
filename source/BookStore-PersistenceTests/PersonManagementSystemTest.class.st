"
A PersonManagementSystemTest is a test class for testing the behavior of PersonManagementSystem
"
Class {
	#name : #PersonManagementSystemTest,
	#superclass : #TestCase,
	#instVars : [
		'rootSystem',
		'managementSystem'
	],
	#category : 'BookStore-PersistenceTests'
}

{ #category : #'Test Support' }
PersonManagementSystemTest >> anotherPerson [
	^ PersonTestResource current julioCortazar 
]

{ #category : #'Test Support' }
PersonManagementSystemTest >> bookWrittenBy: aPerson [

	^ Book
		titled: 'El placer de Cocinar a Milhouse'
		editedBy: 'The Androids Dungeon & Baseball Card Shop'
		createdOn: 2001
		by: aPerson
]

{ #category : #initialization }
PersonManagementSystemTest >> setUp [
	|persistenceSystem|
	rootSystem := BookstoreInstallation new installSystem.
	persistenceSystem := (rootSystem systemImplementing: #PersistenceSystemInterface).
	persistenceSystem login: self setUpLogin.
	rootSystem startUp.
	persistenceSystem dropAllThenCreateSchema.
	managementSystem := rootSystem systemImplementing: #ManagementSystemInterface
]

{ #category : #initialization }
PersonManagementSystemTest >> setUpLogin [
	"aqui podemos setear el login a la base que se utilizara para correr los tests"

	^ Login new
		username: 'root';
		password: '';
		connectString: 'localhost_Bookstore';
		yourself
]

{ #category : #'Test Support' }
PersonManagementSystemTest >> somePerson [
	^ PersonTestResource current eduardoSacheri
]

{ #category : #'Test Support' }
PersonManagementSystemTest >> somePersonToModify [
	^ Person named: 'Eduardo' lastName: 'Sacheri' bornIn: 'Argentina'.
]

{ #category : #initialization }
PersonManagementSystemTest >> tearDown [
	(rootSystem systemImplementing: #PersistenceSystemInterface) dropAllTables.
	(rootSystem systemImplementing: #PersistenceSystemInterface) shutDown.
	rootSystem shutDown
]

{ #category : #Tests }
PersonManagementSystemTest >> testAddPerson [
	| person |
	self assert: managementSystem getAllPersons isEmpty.
	person := self somePerson.
	managementSystem add: person.
	self assertCollection: managementSystem getAllPersons hasSameElements: (Array with: person)
]

{ #category : #Tests }
PersonManagementSystemTest >> testCountPersonsOnEmptyDatabase [
	self assert: managementSystem countPersons equals: 0
]

{ #category : #Tests }
PersonManagementSystemTest >> testRemovePerson [
	self assert: managementSystem getAllPersons isEmpty.
	managementSystem add: self somePerson.
	self assert: managementSystem countPersons equals: 1.
	managementSystem remove: managementSystem getAllPersons anyOne.
	self assert: managementSystem getAllPersons isEmpty 
]

{ #category : #Tests }
PersonManagementSystemTest >> testRemovePersonById [
	self assert: managementSystem getAllPersons isEmpty.
	managementSystem add: self somePerson.
	self assert: managementSystem countPersons equals: 1.
	managementSystem removePersonById: managementSystem getAllPersons anyOne id.
	self assert: managementSystem getAllPersons isEmpty.
]

{ #category : #Tests }
PersonManagementSystemTest >> testRemovePersonHavingABookNotPossibleBecauseOfForeignKey [
	| book person |

	person := self somePerson.
	book := self bookWrittenBy: person.
	managementSystem add: book.
	managementSystem add: person.
	self should: [managementSystem removePersonById: person id] raise: GlorpDatabaseWriteError	
]

{ #category : #Tests }
PersonManagementSystemTest >> testUpdatePersonWith [
	| somePerson anUpdatedPerson personFromDatabase |
	somePerson := self somePerson.
	anUpdatedPerson := self anotherPerson.
	managementSystem add: somePerson.
	managementSystem update: somePerson with: anUpdatedPerson.
	self assert: managementSystem countPersons equals: 1.
	personFromDatabase := managementSystem getAllPersons anyOne.
	self assert: personFromDatabase equals: anUpdatedPerson
]
