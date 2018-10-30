"
Tests for Person
"
Class {
	#name : #PersonTest,
	#superclass : #TestCase,
	#category : 'BookStore-ModelTests'
}

{ #category : #tests }
PersonTest >> testAccessing [
	| person |
	person := Person named: 'Gabriel' lastName: 'García Márquez' bornIn: 'Colombia'.
	self
		assert: person firstName equals: 'Gabriel';
		assert: person lastName equals: 'García Márquez';
		assert: person country equals: 'Colombia'
]

{ #category : #tests }
PersonTest >> testFailedCreation [
	self
		should: [ Person named: '' lastName: 'García Márquez' bornIn: 'Colombia' ]
			raise: Error
			withExceptionDo: [ :ex | self assert: ex messageText equals: 'Nil property in Person' ];
		should: [ Person named: nil lastName: 'García Márquez' bornIn: 'Colombia' ]
			raise: Error
			withExceptionDo: [ :ex | self assert: ex messageText equals: 'Nil property in Person' ];
		should: [ Person named: 'Gabriel' lastName: '' bornIn: 'Colombia' ]
			raise: Error
			withExceptionDo: [ :ex | self assert: ex messageText equals: 'Nil property in Person' ];
		should: [ Person named: 'Gabriel' lastName: nil bornIn: 'Colombia' ]
			raise: Error
			withExceptionDo: [ :ex | self assert: ex messageText equals: 'Nil property in Person' ]
]
