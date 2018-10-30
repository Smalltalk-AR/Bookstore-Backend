Class {
	#name : #BooksManagementSystemTest,
	#superclass : #TestCase,
	#instVars : [
		'rootSystem',
		'managementSystem'
	],
	#category : 'BookStore-PersistenceTests'
}

{ #category : #'Test Support' }
BooksManagementSystemTest >> anotherBook [
	^ BookTestResource current thePleasureOfCookingMilhouse 
]

{ #category : #'Test Support' }
BooksManagementSystemTest >> anotherBookWrittenBy: aPerson [ 

	^ Book
		titled: 'Bestiario'
		editedBy: 'Sudamericana'
		createdOn: 1951
		by:aPerson
]

{ #category : #'Test Support' }
BooksManagementSystemTest >> book [
	^ BookTestResource current bestiary 
]

{ #category : #'Test Support' }
BooksManagementSystemTest >> bookWrittenBy: aPerson [

	^ Book
		titled: 'El placer de Cocinar a Milhouse'
		editedBy: 'The Androids Dungeon & Baseball Card Shop'
		createdOn: 2001
		by: aPerson
]

{ #category : #'Test Support' }
BooksManagementSystemTest >> person [

	^ Person named: 'Julio' lastName: 'Cortázar' bornIn: 'Argentina'
]

{ #category : #Initialization }
BooksManagementSystemTest >> setUp [
	|persistenceSystem|
	rootSystem := BookstoreInstallation new installSystem.
	persistenceSystem := (rootSystem systemImplementing: #PersistenceSystemInterface).
	persistenceSystem login: self setUpLogin.
	rootSystem startUp.
	persistenceSystem dropAllThenCreateSchema.
	managementSystem := rootSystem systemImplementing: #ManagementSystemInterface
]

{ #category : #Initialization }
BooksManagementSystemTest >> setUpLogin [
	"aqui podemos setear el login a la base que se utilizara para correr los tests"

	^ Login new
		username: 'root';
		password: '';
		connectString: 'localhost_Bookstore';
		yourself
]

{ #category : #Initialization }
BooksManagementSystemTest >> tearDown [
	(rootSystem systemImplementing: #PersistenceSystemInterface) dropAllTables.
	(rootSystem systemImplementing: #PersistenceSystemInterface) shutDown.
	rootSystem shutDown
]

{ #category : #Tests }
BooksManagementSystemTest >> testAddBook [
	| book |
	self assert: managementSystem getAllBooks isEmpty.
	book := self bookWrittenBy: self person.
	managementSystem add: book.
	self assertCollection: managementSystem getAllBooks hasSameElements: (Array with: book)
]

{ #category : #Tests }
BooksManagementSystemTest >> testAddBookPreviouslyAddingPerson [
	| book person |
	
	self assert: managementSystem getAllBooks isEmpty.
	person := managementSystem add: self person.
	book := self bookWrittenBy: person.
	managementSystem add: book.
	self assertCollection: managementSystem getAllBooks hasSameElements: (Array with: book).
]

{ #category : #Tests }
BooksManagementSystemTest >> testRemoveBook [
	| book |
	
	self assert: managementSystem getAllBooks isEmpty.
	book := self bookWrittenBy: self person.
	managementSystem add: book.
	self assertCollection: managementSystem getAllBooks hasSameElements: (Array with: book).
	managementSystem removeBookById: book id.
	self assert: managementSystem getAllBooks isEmpty.
]

{ #category : #Tests }
BooksManagementSystemTest >> testRemoveBookBeingPropertyOfAPersonByNonExclusiveRelationship [
	| book person  |
	
	person := self person.
	book := self bookWrittenBy: person.
	managementSystem add: person.
	managementSystem add: book.
	
	managementSystem removeBookById: book id.
	
	self assert: managementSystem getAllBooks isEmpty.
	self assertCollection: managementSystem getAllPersons hasSameElements: (Array with: person)
]

{ #category : #Tests }
BooksManagementSystemTest >> testUpdateBook [
	| book anotherBook |
	self assert: managementSystem getAllBooks isEmpty.
	book := self bookWrittenBy: self person.
	anotherBook := self anotherBookWrittenBy: self person.
	managementSystem add: book.
	managementSystem updateBookById: book id with: anotherBook.
	self assertCollection: managementSystem getAllBooks hasSameElements: (Array with: anotherBook)
]
