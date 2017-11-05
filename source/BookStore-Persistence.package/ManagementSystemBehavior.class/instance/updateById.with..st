private - Managing
updateById: anId
		with: anObject.
	^ generalPersistenceSystem update: (self getById: anId) with: anObject