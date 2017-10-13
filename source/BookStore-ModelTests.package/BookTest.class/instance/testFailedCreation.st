Test
testFailedCreation
	self
		should: [ Book
				titled: ''
				wroteBy: 'author'
				editedBy: 'editorial'
				createdOn: 2001 ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Nil property in Book' ].
	self
		should: [ Book
				titled: 'title'
				wroteBy: 'author'
				editedBy: 'editorial'
				createdOn: nil ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Nil property in Book' ]