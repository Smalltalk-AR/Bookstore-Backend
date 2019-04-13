"
..
"
Class {
	#name : #SystemModule,
	#superclass : #Object,
	#category : 'BookStore-PersistenceModules'
}

{ #category : #private }
SystemModule >> >> anInterfaceKey [

	^ self rootSystem >> anInterfaceKey
]

{ #category : #accessing }
SystemModule >> install [

	^self systemsToInstall
]

{ #category : #private }
SystemModule >> installSystems [

	self withSystemsToInstallDo: [ :aSubsystem | self rootSystem register: aSubsystem ]
]

{ #category : #testing }
SystemModule >> isEquivalentTo: anotherModule [

	^anotherModule isA: self class
]

{ #category : #accessing }
SystemModule >> name [

	self subclassResponsibility
]

{ #category : #private }
SystemModule >> postInstall [

	self >> #InstalledModuleRegistrationSystem registerAsInstalled: self
]

{ #category : #accessing }
SystemModule >> printOn: aStream [

	aStream print: self name
]

{ #category : #accessing }
SystemModule >> register: aSystemCreationBlock in: systems [

	^systems add: aSystemCreationBlock value
]

{ #category : #actions }
SystemModule >> reinstall [
]

{ #category : #private }
SystemModule >> rootSystem [

	^ self subclassResponsibility
]

{ #category : #private }
SystemModule >> systemInterfacesToInstall [

	self subclassResponsibility
]

{ #category : #accessing }
SystemModule >> systemsToInstall [

	"Se espera que los módulos que requieren instalar un sistema implementen el mensaje register*SystemForInstallationIn: retornando la instancia (no iniciada) del sistema"

	| subsystemsToInstall |

	subsystemsToInstall := OrderedCollection new.

	(KeywordMessageSendingCollector	
		sendingAllMessagesBeginningWith: #register asString
		andEndingWith: #SystemForInstallationIn: asString
		to: self
		with: subsystemsToInstall)
			value.
			
	^subsystemsToInstall
]

{ #category : #private }
SystemModule >> withSystemsToInstallDo: aBlock [

	"Modules can reflectively provide the systems to install by implementing messages matching: register*SystemForInstallationIn:
	Returning the system instance (not started)"

	| subsystemsToInstall |

	subsystemsToInstall := OrderedCollection new.

	(KeywordMessageSendingCollector
		sendingAllMessagesBeginningWith: 'register'
		andEndingWith: 'SystemForInstallationIn:'
		to: self
		with: subsystemsToInstall) value.

	subsystemsToInstall do: aBlock
]
