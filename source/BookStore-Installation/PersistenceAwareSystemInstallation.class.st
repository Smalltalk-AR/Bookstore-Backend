"
.
"
Class {
	#name : #PersistenceAwareSystemInstallation,
	#superclass : #SystemInstallation,
	#instVars : [
		'persistenceModule'
	],
	#category : 'BookStore-Installation'
}

{ #category : #'instance creation' }
PersistenceAwareSystemInstallation class >> new [

	^self newWithRelationalDatabasePersistency
]

{ #category : #'instance creation' }
PersistenceAwareSystemInstallation class >> newWithRelationalDatabasePersistency [

	^self persistingWith: RelationalDatabaseBasedPersistenceModule
]

{ #category : #'instance creation' }
PersistenceAwareSystemInstallation class >> persistingWith: aPersistenceModule [

	^super new initializePersistingWith: aPersistenceModule
]

{ #category : #initialization }
PersistenceAwareSystemInstallation >> initializePersistingWith: aPersistenceModule [

	persistenceModule := aPersistenceModule
]

{ #category : #initialization }
PersistenceAwareSystemInstallation >> installSystem [

	| subsystems rootSystem |
	
	self registerSystemInterfaces.
	subsystems := (self systemModulesToInstall flatCollect: [ :module | module new install ]).
	rootSystem := CompositeSystem of: subsystems.
	self persistenceModulesToInstall do: [ :module | (module toInstallOn: rootSystem) registerPersistence ].
	^ rootSystem
]

{ #category : #initialization }
PersistenceAwareSystemInstallation >> persistenceModulesToInstall [

	self subclassResponsibility
]

{ #category : #initialization }
PersistenceAwareSystemInstallation >> systemModulesToInstall [

	self subclassResponsibility
]
