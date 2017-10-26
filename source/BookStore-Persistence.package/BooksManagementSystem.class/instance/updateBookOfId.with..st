Managing
updateBookOfId: anId with: anotherBook
	| aBook |
	aBook := self bookOfId: anId.
	^ generalPersistenceSystem update: aBook with: anotherBook