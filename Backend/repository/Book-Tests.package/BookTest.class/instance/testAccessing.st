Test
testAccessing
	| book |
	book := Book
		titled: 'title'
		wroteBy: 'author'
		editedBy: 'editorial'
		createdOn: 2001.
	self
		assert: book title equals: 'title';
		assert: book author equals: 'author';
		assert: book editorial equals: 'editorial';
		assert: book year equals: 2001