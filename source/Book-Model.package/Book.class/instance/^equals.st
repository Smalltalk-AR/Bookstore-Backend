Comparing
= anObject
	^ (anObject isA: self class)
		ifTrue: [ title = anObject title
				and: [ author = anObject author
						and: [ editorial = anObject editorial and: [ year = anObject year ] ] ] ]
		ifFalse: [ false]