"
.

"
Class {
	#name : #SystemInstallation,
	#superclass : #Object,
	#category : 'BookStore-Installation'
}

{ #category : #installing }
SystemInstallation >> beAwareOfShutDownOf: aCompositeSystem [ 

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SystemInstallation >> beAwareOfShutdown: aCompositeSystemImplementation [

	self subclassResponsibility
]

{ #category : #accessing }
SystemInstallation >> description [

	self subclassResponsibility
]

{ #category : #installing }
SystemInstallation >> install: aVersionName [

	| rootSystem |
	
	rootSystem := CompositeSystem installedBy: self.
	self registerModuleRegistrationSystemOn: rootSystem.
	self modulesToInstall do: [ :module | (module toInstallOn: rootSystem) install ].
	^rootSystem
]

{ #category : #accessing }
SystemInstallation >> modulesToInstall [

	"Subclasses need to provide a set of module factories to be installed, they will be instantiated against the rootSystem"

	self subclassResponsibility
]

{ #category : #accessing }
SystemInstallation >> name [

	self subclassResponsibility
]

{ #category : #private }
SystemInstallation >> registerModuleRegistrationSystemOn: aRootSystem [

	aRootSystem register: InstalledModuleRegistrationSystem new
]

{ #category : #'as yet unclassified' }
SystemInstallation >> reinstallOn: aCompositeSystem [

	self subclassResponsibility
]

{ #category : #accessing }
SystemInstallation >> value: anInstallationContext [

	self subclassResponsibility
]
