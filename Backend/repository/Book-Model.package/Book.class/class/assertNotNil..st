Testing
assertNotNil: anObject
	(anObject isNil or: [ anObject isString and: [ anObject isEmpty ] ])
		ifTrue: [ NilBookProperty signal: 'Nil property in Book' ]