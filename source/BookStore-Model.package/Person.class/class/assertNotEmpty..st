asserting
assertNotEmpty: aString
	(aString isNil or: [ aString isString and: [ aString isEmpty ] ])
		ifTrue: [ Error signal: 'Nil property in Person' ]