"
Test Resource of Book Class
"
Class {
	#name : #BookTestResource,
	#superclass : #Object,
	#instVars : [
		'thePleasureOfCookingMilhouse',
		'bestiary'
	],
	#classVars : [
		'Current'
	],
	#category : 'BookStore-TestResource'
}

{ #category : #Accessing }
BookTestResource class >> current [
	^ Current ifNil: [ self newInstance ] ifNotNil: [ :system | system ]
]

{ #category : #'Instance Creation' }
BookTestResource class >> new [
	^ self current
]

{ #category : #'Instance Creation' }
BookTestResource class >> newInstance [
	^ Current := self basicNew initialize
]

{ #category : #Accessing }
BookTestResource >> bestiary [
	^ bestiary copy
]

{ #category : #private }
BookTestResource >> eduardoSacheri [
	^ PersonTestResource current eduardoSacheri
]

{ #category : #Initialization }
BookTestResource >> initialize [
	thePleasureOfCookingMilhouse := Book
		titled: 'El placer de Cocinar a Milhouse'
		editedBy: 'The Androids Dungeon & Baseball Card Shop'
		createdOn: 2001
		by: 'Skinner'.
	bestiary := Book
		titled: 'Bestiario'
		editedBy: 'Sudamericana'
		createdOn: 1951
		by: 'Julio Cortazar'
]

{ #category : #private }
BookTestResource >> julioCortazar [
	^ PersonTestResource current julioCortazar
]

{ #category : #Accessing }
BookTestResource >> thePleasureOfCookingMilhouse [

	^ thePleasureOfCookingMilhouse copy
]
