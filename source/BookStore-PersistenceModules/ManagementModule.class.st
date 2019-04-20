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

{ #category : #'Instance Creation' }
ManagementModule class >> toInstallOn: aRootSystem [

   ^self new initializeToInstallOn: aRootSystem
]

{ #category : #accessing }
ManagementModule >> initializeToInstallOn: aRootSystem [
	rootSystem := aRootSystem.
	self registerSystemInterface
]

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

{ #category : #accessing }
ManagementModule >> registerSystemInterface [
	[ Kepler
		registerInterfaceAt: #ManagementSystemInterface
		named: 'Management System Interface'
		declaring:
			#(#add: #countBooks #countPersons #getAllBooks #getAllPersons #getBookById: #getPersonById: #remove: #removeById: #update:with: #updateById:with:) ]
		on: ConflictingObjectFound
		do: [ :signal | signal return ]
]

{ #category : #private }
ManagementModule >> rootSystem [
	^ rootSystem
]

{ #category : #private }
ManagementModule >> systemInterfacesToInstall [

	^#(#ManagementSystemInterface)
]
