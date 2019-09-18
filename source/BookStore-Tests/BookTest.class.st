"
Tests for Book
"
Class {
	#name : #BookTest,
	#superclass : #TestCase,
	#category : #'BookStore-Tests'
}

{ #category : #test }
BookTest >> testAccessing [

	| book |

	book := Book
		titled: 'title'
		editedBy: 'editorial'
		createdOn: 2001
		by: 'pepe'.
	self
		assert: book title equals: 'title';
		assert: book editorial equals: 'editorial';
		assert: book releaseYear equals: 2001;
		assert: book author equals: 'pepe'
]

{ #category : #test }
BookTest >> testFailedCreation [

	self
		should: [ Book
				titled: ''
				editedBy: 'editorial'
				createdOn: 2001
				by: 'pepe'
			]
		raise: AssertionFailed
		withMessageText: 'Nil property in Book'.
	self
		should: [ Book
				titled: 'title'
				editedBy: ''
				createdOn: 2001
				by: 'pepe'
			]
		raise: AssertionFailed
		withMessageText: 'Nil property in Book'.
	self
		should: [ Book
				titled: 'title'
				editedBy: 'editorial'
				createdOn: nil
				by: 'pepe'
			]
		raise: AssertionFailed
		withMessageText: 'Nil property in Book'
]
