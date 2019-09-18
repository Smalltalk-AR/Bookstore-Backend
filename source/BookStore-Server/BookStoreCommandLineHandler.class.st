"
.
"
Class {
	#name : #BookStoreCommandLineHandler,
	#superclass : #ApplicationStarterCommandLineHandler,
	#category : 'BookStore-Server'
}

{ #category : #accessing }
BookStoreCommandLineHandler class >> commandName [

	^ 'start-book-store'
]

{ #category : #activation }
BookStoreCommandLineHandler >> basicActivate [

	| runner |

	runner := BookStoreRunner
		toDeployOnAddress: ( self configuration at: #'bind-address' )
		andPort: ( self configuration at: #port )
		connectingToDatbaseWith:
			( Login new
				username: ( self configuration at: #'db-username' );
				password: ( self configuration at: #'db-password' );
				port: ( self configuration at: #'db-port' );
				connectString: ( self configuration at: #'db-host' ) , '_' , ( self configuration at: #'db-database' );
				yourself ).
	runner start
]

{ #category : #'private - accessing' }
BookStoreCommandLineHandler >> configurationDefinition [

	^ OrderedCollection new
		add:
			( OptionalArgument named: #port defaultingTo: BookStoreRunner defaultPort convertingWith: #asNumber );
		add:
			( OptionalArgument
				named: #'bind-address'
				defaultingTo: '0.0.0.0'
				convertingWith: [ :address | NetNameResolver addressForName: address ] );
		add: ( MandatoryArgument named: 'db-username' );
		add: ( OptionalArgument named: 'db-password' defaultingTo: '' );
		add: ( OptionalArgument named: 'db-host' defaultingTo: 'localhost' );
		add: ( OptionalArgument named: 'db-port' defaultingTo: 3306 convertingWith: #asNumber );
		add: ( MandatoryArgument named: 'db-database' );
		asArray
]

{ #category : #'private - accessing' }
BookStoreCommandLineHandler >> logPrefix [

	^ 'Bookstore'
]
