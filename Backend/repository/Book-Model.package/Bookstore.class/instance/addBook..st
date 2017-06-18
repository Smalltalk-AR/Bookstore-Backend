Book- Querying
addBook: aBook

	self glorpSession inUnitOfWorkDo: [ self glorpSession register: aBook ]