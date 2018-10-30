"
A simple Book
"
Class {
	#name : #Book,
	#superclass : #Object,
	#instVars : [
		'id',
		'title',
		'editorial',
		'releaseYear',
		'author'
	],
	#category : 'BookStore-Model'
}

{ #category : #Testing }
Book class >> assertNotEmpty: anObject [
	(anObject isNil or: [ anObject isEmpty ])
		ifTrue: [ Error signal: 'Nil property in Book' ]
]

{ #category : #Testing }
Book class >> assertNotNil: anObject [
	anObject isNil
		ifTrue: [ Error signal: 'Nil property in Book' ]
]

{ #category : #'Instance Creation' }
Book class >> titled: aTitle editedBy: anEditorial createdOn: aYear by: anAuthor [

	self
		assertNotEmpty: aTitle;
		assertNotEmpty: anEditorial;
		assertNotNil: aYear;
		assertNotNil: anAuthor.
		
	^ self new
		initializeTitled: aTitle
		editedBy: anEditorial
		createdOn: aYear
		by: anAuthor
]

{ #category : #Comparing }
Book >> = anObject [

	^ (anObject isKindOf: self class)
		and: [ title = anObject title
				and: [ editorial = anObject editorial and: [ releaseYear = anObject releaseYear and: [ author = anObject author ] ] ] ]
]

{ #category : #Accessing }
Book >> author [

	^ author
]

{ #category : #Accessing }
Book >> editorial [
	^ editorial
]

{ #category : #Comparing }
Book >> hash [

	^ title hash bitXor: (editorial hash bitXor: (releaseYear hash bitXor: author hash))
]

{ #category : #Accessing }
Book >> id [
	^ id
]

{ #category : #Accessing }
Book >> id: anId [
	id := anId
]

{ #category : #Initialization }
Book >> initializeTitled: aTitle editedBy: anEditorial createdOn: aYear by: anAuthor [

	title := aTitle.
	editorial := anEditorial.
	releaseYear := aYear.
	author := anAuthor 
]

{ #category : #Accessing }
Book >> releaseYear [
	^ releaseYear
]

{ #category : #synchronization }
Book >> synchronizeWith: aBook [

	title := aBook title.
	editorial := aBook editorial.
	releaseYear := aBook releaseYear.
	author := aBook author
]

{ #category : #Accessing }
Book >> title [
	^ title
]
