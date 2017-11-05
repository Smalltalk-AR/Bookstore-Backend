Test
testFailedCreation
	self
		should: [ Book
				titled: ''
				editedBy: 'editorial'
				createdOn: 2001
				by: self someAuthor]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Nil property in Book' ].
	self
		should: [ Book
				titled: 'title'
				editedBy: ''
				createdOn: 2001
				by: self someAuthor ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Nil property in Book' ].
	self
		should: [ Book
				titled: 'title'
				editedBy: 'editorial'
				createdOn: nil
				by: self someAuthor]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Nil property in Book' ]