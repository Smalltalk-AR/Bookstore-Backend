"
.
"
Class {
	#name : #BookstoreInstallation,
	#superclass : #SystemInstallation,
	#instVars : [
		'persistenceModule'
	],
	#category : #'BookStore-Installation'
}

{ #category : #'instance creation' }
BookstoreInstallation class >> new [

	^self newWithRelationalDatabasePersistency
]

{ #category : #'instance creation' }
BookstoreInstallation class >> newWithRelationalDatabasePersistency [

	^self persistingWith: RelationalDatabaseBasedPersistenceModule
]

{ #category : #'instance creation' }
BookstoreInstallation class >> persistingWith: aPersistenceModule [

	^super new initializePersistingWith: aPersistenceModule
]

{ #category : #installing }
BookstoreInstallation >> beAwareOfShutDownOf: aCompositeSystem [ 
]

{ #category : #accessing }
BookstoreInstallation >> description [

	^#'Bookstore' 
]

{ #category : #initialization }
BookstoreInstallation >> initializePersistingWith: aPersistenceModule [

	persistenceModule := aPersistenceModule
]

{ #category : #accessing }
BookstoreInstallation >> modulesToInstall [

	^ OrderedCollection
		with: persistenceModule
		with: ManagementModule
		with: BooksManagementModule
		with: PersonManagementModule
]

{ #category : #accessing }
BookstoreInstallation >> name [

	'Instalación de Bookstore'
]
