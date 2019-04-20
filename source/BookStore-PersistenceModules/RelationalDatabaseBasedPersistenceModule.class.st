"
s
"
Class {
	#name : #RelationalDatabaseBasedPersistenceModule,
	#superclass : #SystemModule,
	#instVars : [
		'rootSystem'
	],
	#category : #'BookStore-PersistenceModules'
}

{ #category : #'Instance Creation' }
RelationalDatabaseBasedPersistenceModule class >> toInstallOn: aRootSystem [

   ^self new initializeToInstallOn: aRootSystem
]

{ #category : #Accessing }
RelationalDatabaseBasedPersistenceModule >> initializeToInstallOn: aRootSystem [
	rootSystem := aRootSystem.
	self registerSystemInterface
]

{ #category : #Accessing }
RelationalDatabaseBasedPersistenceModule >> name [

	^#'Modulo de Persistencia en Base de Datos Relacional' 
]

{ #category : #Accessing }
RelationalDatabaseBasedPersistenceModule >> registerRelationalDatabaseBasedPersistenceSystemForInstallationIn: systems [

	^ self
		register: [ RDBPersistenceSystem new ]
		in: systems
]

{ #category : #Accessing }
RelationalDatabaseBasedPersistenceModule >> registerSystemInterface [
	[ Kepler
		registerInterfaceAt: #PersistenceSystemInterface
		named: 'Persistence System Interface'
		declaring:
			#(#add: #allOf: #countOf: #findOneOf:satisfying: remove: #update:with:) ]
		on: ConflictingObjectFound
		do: [ :signal | signal return ]
]

{ #category : #private }
RelationalDatabaseBasedPersistenceModule >> rootSystem [

	^ rootSystem
]

{ #category : #private }
RelationalDatabaseBasedPersistenceModule >> systemInterfacesToInstall [

	^#(#PersistenceSystemInterface)
]
