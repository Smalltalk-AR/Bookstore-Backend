tests
testFailedCreation
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