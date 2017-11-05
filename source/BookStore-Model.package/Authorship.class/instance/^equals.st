Accessing
= anObject
	^ (anObject isKindOf: self class)
		and: [ book = anObject book and: [ person = anObject person ] ]