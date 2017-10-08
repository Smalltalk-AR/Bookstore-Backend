Query
add: anObject

	self glorpSession inUnitOfWorkDo: [ self glorpSession register: anObject ]