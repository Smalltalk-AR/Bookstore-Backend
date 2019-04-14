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

{ #category : #private }
RelationalDatabaseBasedPersistenceModule >> rootSystem [

	^ rootSystem
]

{ #category : #private }
RelationalDatabaseBasedPersistenceModule >> systemInterfacesToInstall [

	^#(#PersistenceSystemInterface)
]
