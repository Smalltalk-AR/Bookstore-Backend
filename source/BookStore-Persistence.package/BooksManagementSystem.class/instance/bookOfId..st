Querying
bookOfId: anId
	^ generalPersistenceSystem
		findOneOf: self describedClass
		satisfying: [ :each | each id = anId ]