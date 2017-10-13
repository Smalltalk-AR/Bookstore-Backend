Testing
assertNotNil: anObject
	(anObject isNil or: [ anObject isString and: [ anObject isEmpty ] ])
		ifTrue: [ Error signal: 'Nil property in Book' ]