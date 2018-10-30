"
Nuevo tipo de session pensando para aplicaciones stateless
"
Class {
	#name : #StatelessApplicationGlorpSession,
	#superclass : #GlorpSession,
	#category : #'BookStore-Persistence'
}

{ #category : #testing }
StatelessApplicationGlorpSession >> isNew: anObject [

 ^anObject id ifNil: [ super isNew: anObject  ]  ifNotNil: [ false ] 
]
