Comparing
= anObject
	^ (anObject isKindOf: self class)
			and: [ firstName = anObject firstName
				and: [ lastName = anObject lastName 
					and: [ country = anObject country ] ] ]