Comparing
= anObject
	^ (anObject isKindOf: self class)
		ifTrue: [ firstName = anObject firstName
				and: [ lastName = anObject lastName and: [ country = anObject country ] ] ]
		ifFalse: [ false ]