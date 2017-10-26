Testing
assertNotEmpty: anObject
	(anObject isNil or: [ anObject isEmpty ])
		ifTrue: [ Error signal: 'Nil property in Book' ]