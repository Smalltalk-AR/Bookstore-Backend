Book- Querying
updateBookOfId: anId with: book
	self glorpSession
		inUnitOfWorkDo: [ | aBook |
			aBook := self glorpSession readOneOf: Book where: [ :each | each id = anId ].
			aBook synchronizeWith: book.
			self glorpSession register: aBook ]