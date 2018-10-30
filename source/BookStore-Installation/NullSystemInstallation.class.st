"
.
"
Class {
	#name : #NullSystemInstallation,
	#superclass : #SystemInstallation,
	#category : 'BookStore-Installation'
}

{ #category : #'as yet unclassified' }
NullSystemInstallation >> beAwareOfShutdown: aCompositeSystemImplementation [
]

{ #category : #accessing }
NullSystemInstallation >> description [

	^''
]

{ #category : #'as yet unclassified' }
NullSystemInstallation >> reinstallOn: aCompositeSystem [
]

{ #category : #accessing }
NullSystemInstallation >> value: anInstallationContext [

	^CompositeSystem of: #().
]
