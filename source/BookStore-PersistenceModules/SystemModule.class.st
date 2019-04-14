"
..
"
Class {
	#name : #SystemModule,
	#superclass : #Object,
	#category : 'BookStore-PersistenceModules'
}

{ #category : #accessing }
SystemModule >> install [

	^self systemsToInstall
]

{ #category : #accessing }
SystemModule >> name [

	self subclassResponsibility
]

{ #category : #accessing }
SystemModule >> printOn: aStream [

	aStream print: self name
]

{ #category : #accessing }
SystemModule >> register: aSystemCreationBlock in: systems [

	^systems add: aSystemCreationBlock value
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
