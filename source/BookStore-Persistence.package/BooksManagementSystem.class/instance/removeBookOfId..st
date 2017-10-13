Querying
removeBookOfId: anId
| aBook |
	aBook := self bookOfId: anId.
	^ generalPersistenceSystem remove: aBook