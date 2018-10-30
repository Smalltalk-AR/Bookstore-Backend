"
Test Resource of Person Class
"
Class {
	#name : #PersonTestResource,
	#superclass : #Object,
	#instVars : [
		'eduardoSacheri',
		'julioCortazar'
	],
	#classVars : [
		'Current'
	],
	#category : 'BookStore-TestResource'
}

{ #category : #Accessing }
PersonTestResource class >> current [

	^ Current ifNil: [ self newInstance ] ifNotNil: [ :system | system ]
]

{ #category : #'Instance Creation' }
PersonTestResource class >> new [
	^ self current
]

{ #category : #'Instance Creation' }
PersonTestResource class >> newInstance [
	^ Current := self basicNew initialize
]

{ #category : #Accessing }
PersonTestResource >> eduardoSacheri [

	^ eduardoSacheri
]

{ #category : #Initialization }
PersonTestResource >> initialize [
	eduardoSacheri := Person named: 'Eduardo' lastName: 'Sacheri' bornIn: 'Argentina'.
	julioCortazar := Person named: 'Julio' lastName: 'Cortázar' bornIn: 'Argentina'
]

{ #category : #Accessing }
PersonTestResource >> julioCortazar [
	^ julioCortazar
]
