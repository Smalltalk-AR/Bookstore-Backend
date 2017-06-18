Book- Querying
removeBook: aBook

	self glorpSession inUnitOfWorkDo: [ self glorpSession delete: aBook ]

