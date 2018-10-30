"
.
"
Class {
	#name : #ManagementModule,
	#superclass : #SystemModule,
	#category : 'BookStore-PersistenceModules'
}

{ #category : #accessing }
ManagementModule >> name [

	^#'Modulo de Administración' 
]

{ #category : #accessing }
ManagementModule >> registerManagementSystemForInstallationIn: systems [

	^ self
		register: [ ManagementSystem new ]
		in: systems
]
