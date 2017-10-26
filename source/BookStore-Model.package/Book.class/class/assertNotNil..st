Testing
assertNotNil: anObject
	anObject isNil
		ifTrue: [ Error signal: 'Nil property in Book' ]