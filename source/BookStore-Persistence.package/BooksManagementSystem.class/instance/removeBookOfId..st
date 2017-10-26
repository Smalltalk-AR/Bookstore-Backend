Managing
removeBookOfId: anId
| aBook |
	aBook := self bookOfId: anId.
	^ self removeBook: aBook