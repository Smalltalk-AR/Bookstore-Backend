"
Management System Behavior
"
Class {
	#name : #ManagementSystem,
	#superclass : #SubsystemImplementation,
	#instVars : [
		'persistenceSystem'
	],
	#category : #'BookStore-Systems'
}

{ #category : #'system specification' }
ManagementSystem class >> implementedInterface [
	 
	 ^SystemInterface >> #ManagementSystemInterface
]

{ #category : #'private - Managing' }
ManagementSystem >> add: anObject [

	^ persistenceSystem add: anObject
]

{ #category : #Querying }
ManagementSystem >> countBooks [

	^ persistenceSystem countOf: Book
]

{ #category : #Querying }
ManagementSystem >> countPersons [

	^ persistenceSystem countOf: Person
]

{ #category : #Querying }
ManagementSystem >> getAllBooks [

	^ persistenceSystem allOf: Book
]

{ #category : #Querying }
ManagementSystem >> getAllPersons [

	^ persistenceSystem allOf: Person
]

{ #category : #Querying }
ManagementSystem >> getBookById: anId [

	^ persistenceSystem findOneOf: Book satisfying: [ :each | each id = anId ]
]

{ #category : #Querying }
ManagementSystem >> getPersonById: anId [

	^ persistenceSystem findOneOf: Person satisfying: [ :each | each id = anId ]
]

{ #category : #initialization }
ManagementSystem >> initialize [

	super initialize.
	persistenceSystem := self unresolvedSystemDependencyTo: #PersistenceSystemInterface
]

{ #category : #'private - Managing' }
ManagementSystem >> remove: anObject [

	^ persistenceSystem remove: anObject
]

{ #category : #'private - Managing' }
ManagementSystem >> removeBookById: anId [

	^ self remove: (self getBookById: anId)
]

{ #category : #'private - Managing' }
ManagementSystem >> removePersonById: anId [

	^ self remove: (self getPersonById: anId)
]

{ #category : #initialization }
ManagementSystem >> resolveDependecies [

		persistenceSystem := self resolveSystemDependencyTo: #PersistenceSystemInterface

]

{ #category : #'private - Managing' }
ManagementSystem >> shutDown [
]

{ #category : #Updating }
ManagementSystem >> update: anObject with: anUpdatedObject [

	^ persistenceSystem update: anObject with: anUpdatedObject
]

{ #category : #'private - Managing' }
ManagementSystem >> updateBookById: anId with: anObject [
		
	^ self update: (self getBookById: anId) with: anObject
]

{ #category : #'private - Managing' }
ManagementSystem >> updatePersonById: anId with: anObject [
		
	^ self update: (self getPersonById: anId) with: anObject
]
