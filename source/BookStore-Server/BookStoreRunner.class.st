"
Interface of the  application. Defining services to deploy
"
Class {
	#name : #BookStoreRunner,
	#superclass : #Object,
	#instVars : [
		'server',
		'rootSystem',
		'installation'
	],
	#category : 'BookStore-Server'
}

{ #category : #Defaults }
BookStoreRunner class >> defaultAdress [
	^ #[127 0 0 1]
]

{ #category : #Defaults }
BookStoreRunner class >> defaultPort [
	^ 1710
]

{ #category : #'Instance Creation' }
BookStoreRunner class >> deploying: anInstallation onAdress: adressByteArray andPort: number [
	^ self new initializeDeploying: anInstallation onAdress: adressByteArray andPort: number

]

{ #category : #Starting }
BookStoreRunner class >> startDeploying: anInstallation [
	^ (self deploying: anInstallation onAdress: self defaultAdress andPort: self defaultPort) start
]

{ #category : #Starting }
BookStoreRunner class >> startDeployingDefault [
	^ self startDeploying: BookstoreInstallation new
]

{ #category : #Initialization }
BookStoreRunner >> initializeDeploying: anInstallation onAdress: adressByteArray andPort: number [

	installation := anInstallation.
	self
		initializeSystems;
		initializeServerOnAdress: adressByteArray andPort: number;
		initializeRoutes
]

{ #category : #Initialization }
BookStoreRunner >> initializeRoutes [

	GenericService deployingOn: server at: '' withApiPath: 'books' delegatingTo: (GenericController workingOn: rootSystem managing: Book).
	GenericService deployingOn: server at: '' withApiPath: 'persons' delegatingTo: (GenericController workingOn: rootSystem managing: Person).
	
]

{ #category : #Initialization }
BookStoreRunner >> initializeServerOnAdress: adressByteArray andPort: aPortNumber [

	server := Teapot
		configure:
			{(#defaultOutput -> #json).
			(#port -> aPortNumber).
			(#debugMode -> true).
			(#bindAddress -> adressByteArray)}
]

{ #category : #Initialization }
BookStoreRunner >> initializeSystems [

	rootSystem := installation installSystem 
	
]

{ #category : #initialization }
BookStoreRunner >> persistenceSystem [
	
	^rootSystem systemImplementing: #PersistenceSystemInterface
]

{ #category : #Actions }
BookStoreRunner >> start [

	server start.
	rootSystem startUp
]

{ #category : #Actions }
BookStoreRunner >> stop [

	server stop.
	rootSystem shutDown
]
