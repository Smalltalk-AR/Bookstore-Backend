Deleting
removePersonWithId: anId
	| person |
	person := self findById: anId.
	^ self remove: person