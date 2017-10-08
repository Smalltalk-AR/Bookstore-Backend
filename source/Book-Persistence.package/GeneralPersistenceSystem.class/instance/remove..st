Query
remove: anObject
	self glorpSession inUnitOfWorkDo: [ self glorpSession delete: anObject ]