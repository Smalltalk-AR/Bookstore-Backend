"
System to manage books
"
Class {
	#name : #BooksManagementModule,
	#superclass : #PersistenceModule,
	#category : 'BookStore-PersistenceModules'
}

{ #category : #Configuring }
BooksManagementModule >> creationDescriptorBlock [

	^ [ :aDescriptor | 
	| table |
	table := self persistenceSystem tableNamed: self tableName.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #title to: (table fieldNamed: 'title').
	(aDescriptor newMapping: DirectMapping) from: #editorial to: (table fieldNamed: 'editorial').
	(aDescriptor newMapping: DirectMapping) from: #releaseYear to: (table fieldNamed: 'releaseYear') .
	aDescriptor oneToOneMapping attributeName: #author;
		referenceClass: Person;
	join: (Join from: (table fieldNamed: 'person_id') to:  ((self persistenceSystem tableNamed:'PERSON') fieldNamed: 'id') ).  ]
]

{ #category : #Configuring }
BooksManagementModule >> creationModelBlock [

	^ [ :aModel | 
	aModel
		newAttributeNamed: #id;
		newAttributeNamed: #title;
		newAttributeNamed: #editorial;
		newAttributeNamed: #releaseYear;
		newAttributeNamed: #author type: Person  ]
]

{ #category : #Configuring }
BooksManagementModule >> creationTableBlock [

	^ [ :aTable | 
		|authorForeignKey persistenceSystem|
	persistenceSystem := self persistenceSystem .
	aTable createFieldNamed: 'id' type: persistenceSystem platform sequence.
	aTable createFieldNamed: 'title' type: persistenceSystem platform text.
	aTable createFieldNamed: 'editorial' type: persistenceSystem platform text.
	aTable createFieldNamed: 'releaseYear' type: persistenceSystem platform int4.
	authorForeignKey := aTable createFieldNamed: 'person_id' type: persistenceSystem platform int4.
	aTable addForeignKeyFrom: authorForeignKey to: ((persistenceSystem tableNamed: 'PERSON') fieldNamed: 'id').
	(aTable fieldNamed: 'id') bePrimaryKey ]
]

{ #category : #Accessing }
BooksManagementModule >> describedClass [

	^ Book
]

{ #category : #Accessing }
BooksManagementModule >> name [

	^#Libros
]

{ #category : #Accessing }
BooksManagementModule >> registerPersistence [

	(PersistenceConfigurationRegistrationAgent toRegisterIn: self persistenceSystem)
		registerConfigurationFor: self
]

{ #category : #Accessing }
BooksManagementModule >> tableName [
	^ 'BOOK'
]
