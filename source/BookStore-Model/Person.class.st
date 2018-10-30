"
Person class
"
Class {
	#name : #Person,
	#superclass : #Object,
	#instVars : [
		'id',
		'firstName',
		'lastName',
		'country'
	],
	#category : 'BookStore-Model'
}

{ #category : #asserting }
Person class >> assertNotEmpty: aString [
	(aString isNil or: [ aString isString and: [ aString isEmpty ] ])
		ifTrue: [ Error signal: 'Nil property in Person' ]
]

{ #category : #'Instance Creation' }
Person class >> named: firstName lastName: aLastName bornIn: aCountry [ 
	self
		assertNotEmpty: firstName;
		assertNotEmpty: aLastName.
	^ self new initializeNamed: firstName lastName: aLastName bornIn: aCountry
]

{ #category : #Comparing }
Person >> = anObject [
	^ (anObject isKindOf: self class)
			and: [ firstName = anObject firstName
				and: [ lastName = anObject lastName 
					and: [ country = anObject country ] ] ]
]

{ #category : #Accessing }
Person >> country [
	^ country
]

{ #category : #Accessing }
Person >> firstName [
	^ firstName
]

{ #category : #Comparing }
Person >> hash [
	^ firstName hash bitXor: (lastName hash bitXor: country hash)
]

{ #category : #Accessing }
Person >> id [
	^ id
]

{ #category : #Accessing }
Person >> id: anId [
	id := anId
]

{ #category : #Initialization }
Person >> initializeNamed: aFirstName lastName: aLastName bornIn: aCountry [

	firstName := aFirstName.
	lastName := aLastName.
	country := aCountry.
]

{ #category : #Accessing }
Person >> lastName [
	^ lastName
]

{ #category : #Synchronization }
Person >> synchronizeWith: aPerson [
	firstName := aPerson firstName.
	lastName := aPerson lastName.
	country := aPerson country
]
