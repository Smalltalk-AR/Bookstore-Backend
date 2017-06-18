Book- Querying
updateBook: aBook from: anotherBook
	| book |
	self glorpSession
		inUnitOfWorkDo: [ book := self glorpSession
				readOneOf: Book
				where: [ :each | each title = aBook title & (each author = aBook author) & (each editorial = aBook editorial) & (each year = aBook year) ].
			book
				title: anotherBook title;
				author: anotherBook author;
				editorial: anotherBook editorial;
				year: anotherBook year.
			self glorpSession register: book ]