Comparing
= anObject
	^ (anObject isKindOf: self class)
		ifTrue: [ title = anObject title and: [ editorial = anObject editorial and: [ releaseYear = anObject releaseYear ] ] ]
		ifFalse: [ false ]