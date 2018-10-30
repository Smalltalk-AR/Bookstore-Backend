"
s
"
Class {
	#name : #RelationalDatabaseBasedPersistenceModule,
	#superclass : #SystemModule,
	#category : 'BookStore-PersistenceModules'
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
