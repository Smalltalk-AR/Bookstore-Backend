"
.
"
Class {
	#name : #ManagementModule,
	#superclass : #SystemModule,
	#instVars : [
		'rootSystem'
	],
	#category : #'BookStore-PersistenceModules'
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

{ #category : #private }
ManagementModule >> rootSystem [
	^ rootSystem
]

{ #category : #private }
ManagementModule >> systemInterfacesToInstall [

	^#(#ManagementSystemInterface)
]
