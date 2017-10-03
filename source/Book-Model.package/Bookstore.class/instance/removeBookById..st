Book- Querying
removeBookById: anId
	self glorpSession
		inUnitOfWorkDo: [ | aBook |
			aBook := self glorpSession readOneOf: Book where: [ :each | each id = anId ].
			self glorpSession delete: aBook ]