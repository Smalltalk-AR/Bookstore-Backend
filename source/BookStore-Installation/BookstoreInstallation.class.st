"
.
"
Class {
	#name : #BookstoreInstallation,
	#superclass : #PersistenceAwareSystemInstallation,
	#category : 'BookStore-Installation'
}

{ #category : #accessing }
BookstoreInstallation >> description [

	^#'Bookstore' 
]

{ #category : #accessing }
BookstoreInstallation >> persistenceModulesToInstall [

	^ OrderedCollection with: BooksManagementModule with: PersonManagementModule 
]

{ #category : #accessing }
BookstoreInstallation >> registerInterfaceAs: aKey named: aName declaring: aSelectorSet [

	SystemInterface
		bind: aKey
		to: (Interface named: aName declaring: aSelectorSet)
]

{ #category : #'private/registering' }
BookstoreInstallation >> registerSystemInterfaces [

[ 	self
		registerInterfaceAs: #PersistenceSystemInterface
		named: 'Persistence System Interface'
		declaring:
			#(#add: #allOf: #countOf: #findOneOf:satisfying: remove: update:with:)	]
		on: ConflictingObjectFound
		do: [ :signal | signal return ].
		
[ 	self 
		registerInterfaceAs: #ManagementSystemInterface
	 	named: 'Management System Interface'
		declaring: 
			#(#add: #countBooks #countPersons #getAllBooks #getAllPersons  #getBookById:
			#getPersonById: #remove: #removeById: #update:with: #updateById:with:)		 ]
		on: ConflictingObjectFound
		do: [ :signal | signal return ].
		
	
]

{ #category : #accessing }
BookstoreInstallation >> systemModulesToInstall [

	^ OrderedCollection with: persistenceModule with: ManagementModule 
]
