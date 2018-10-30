"
.

"
Class {
	#name : #SystemInstallation,
	#superclass : #Object,
	#category : 'BookStore-Installation'
}

{ #category : #'as yet unclassified' }
SystemInstallation >> beAwareOfShutdown: aCompositeSystemImplementation [

	self subclassResponsibility
]

{ #category : #accessing }
SystemInstallation >> description [

	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
SystemInstallation >> reinstallOn: aCompositeSystem [

	self subclassResponsibility
]

{ #category : #accessing }
SystemInstallation >> value: anInstallationContext [

	self subclassResponsibility
]
