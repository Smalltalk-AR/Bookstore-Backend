Comparing
= anObject

	^ (anObject isKindOf: self class)
		and: [ title = anObject title and: [ editorial = anObject editorial and: [ releaseYear = anObject releaseYear ] ] ]