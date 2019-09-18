"
Interface of the  application. Defining services to deploy
"
Class {
	#name : #BookStoreRunner,
	#superclass : #Object,
	#instVars : [
		'server'
	],
	#category : #'BookStore-Server'
}

{ #category : #'Instance Creation' }
BookStoreRunner class >> default [

	^ self
		toDeployOnAddress: self defaultAdress
		andPort: self defaultPort
		connectingToDatbaseWith: self defaultDatabaseLogin
]

{ #category : #Defaults }
BookStoreRunner class >> defaultAdress [

	^ #[127 0 0 1]
]

{ #category : #'Instance Creation' }
BookStoreRunner class >> defaultDatabaseLogin [

	^ Login new
		username: 'root';
		password: '';
		port: 3306;
		connectString: 'localhost_Bookstore';
		yourself
]

{ #category : #Defaults }
BookStoreRunner class >> defaultPort [

	^ 44444
]

{ #category : #'Instance Creation' }
BookStoreRunner class >> toDeployOnAddress: anAdressByteArray andPort: aPortNumber connectingToDatbaseWith: aDatabaseLogin [

	^ self new
		initializeToDeployOnAddress: anAdressByteArray
		andPort: aPortNumber
		connectingToDatbaseWith: aDatabaseLogin
]

{ #category : #initialization }
BookStoreRunner >> initializeRoutes [

	"
	GenericService deployingOn: server at: '' withApiPath: 'books' delegatingTo: (GenericController workingOn: rootSystem managing: Book).
	GenericService deployingOn: server at: '' withApiPath: 'persons' delegatingTo: (GenericController workingOn: rootSystem managing: Person).
	"

	
]

{ #category : #initialization }
BookStoreRunner >> initializeServerOnAdress: adressByteArray andPort: aPortNumber [

	server := Teapot
		configure:
			{( #defaultOutput -> #json ).
			( #port -> aPortNumber ).
			( #debugMode -> true ).
			( #bindAddress -> adressByteArray )}
]

{ #category : #initialization }
BookStoreRunner >> initializeToDeployOnAddress: anAdressByteArray andPort: aPortNumber connectingToDatbaseWith: aDatabaseLogin [

	self
		initializeServerOnAdress: anAdressByteArray andPort: aPortNumber;
		initializeRoutes
]

{ #category : #controlling }
BookStoreRunner >> start [

	server start
]

{ #category : #controlling }
BookStoreRunner >> stop [

	server stop
]
