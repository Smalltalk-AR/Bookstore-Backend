Query
update: anObject with: anotherObject
	self glorpSession
		inUnitOfWorkDo: [ anObject synchronizeWith: anotherObject.
			self glorpSession register: anObject ]