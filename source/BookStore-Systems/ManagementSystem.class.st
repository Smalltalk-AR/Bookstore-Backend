"
Management System Behavior
"
Class {
	#name : #ManagementSystem,
	#superclass : #SubsystemImplementation,
	#category : #'BookStore-Systems'
}

{ #category : #'private - Managing' }
ManagementSystem >> add: anObject [
	^ self persistenceSystem add: anObject
]

{ #category : #Querying }
ManagementSystem >> countBooks [
	^ self persistenceSystem countOf: Book
]

{ #category : #Querying }
ManagementSystem >> countPersons [
	^ self persistenceSystem countOf: Person
]

{ #category : #Querying }
ManagementSystem >> dependencies [
	^ Array with: #PersistenceSystemInterface
]

{ #category : #Querying }
ManagementSystem >> getAllBooks [

	^ self persistenceSystem allOf: Book
]

{ #category : #Querying }
ManagementSystem >> getAllPersons [
	^ self persistenceSystem allOf: Person
]

{ #category : #Querying }
ManagementSystem >> getBookById: anId [
	^ self persistenceSystem
		findOneOf: Book
		satisfying: [ :each | each id = anId ]
]

{ #category : #Querying }
ManagementSystem >> getPersonById: anId [
	^ self persistenceSystem
		findOneOf: Person
		satisfying: [ :each | each id = anId ]
]

{ #category : #installing }
ManagementSystem >> implementedInterfaces [
	^ #(#ManagementSystemInterface)
]

{ #category : #accessing }
ManagementSystem >> name [
	^ 'Systema de Administración'
]

{ #category : #Accessing }
ManagementSystem >> persistenceSystem [
	^ self parent systemImplementing: #PersistenceSystemInterface
]

{ #category : #'private - Managing' }
ManagementSystem >> remove: anObject [
	^ self persistenceSystem remove: anObject
]

{ #category : #'private - Managing' }
ManagementSystem >> removeBookById: anId [

	^ self remove: (self getBookById: anId)
]

{ #category : #'private - Managing' }
ManagementSystem >> removePersonById: anId [

	^ self remove: (self getPersonById: anId)
]

{ #category : #'private - Managing' }
ManagementSystem >> shutDown [
]

{ #category : #Updating }
ManagementSystem >> update: anObject with: anUpdatedObject [
	^ self persistenceSystem update: anObject with: anUpdatedObject
]

{ #category : #'private - Managing' }
ManagementSystem >> updateBookById: anId with: anObject [
		
	^ self update: (self getBookById: anId) with: anObject
]

{ #category : #'private - Managing' }
ManagementSystem >> updatePersonById: anId with: anObject [
		
	^ self update: (self getPersonById: anId) with: anObject
]
