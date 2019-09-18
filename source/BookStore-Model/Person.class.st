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

{ #category : #'Instance Creation' }
Person class >> named: aFirstName lastName: aLastName bornIn: aCountry [

	AssertionChecker
		refuse: [ aFirstName isEmptyOrNil ] because: 'Nil property in Person';
		refuse: [ aLastName isEmptyOrNil ] because: 'Nil property in Person'.
	^ self new initializeNamed: aFirstName lastName: aLastName bornIn: aCountry
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
