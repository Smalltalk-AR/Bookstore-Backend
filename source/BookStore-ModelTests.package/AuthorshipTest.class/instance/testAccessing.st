tests
testAccessing
	| authorship someBook someAuthor |
	someBook := self someBook.
	someAuthor := self someAuthor.
	authorship := Authorship about: someBook by: someAuthor.
	self
		assert: authorship person equals: someAuthor;
		assert: authorship book equals: someBook