tests
testAccessing
	| person |
	person := Person named: 'Gabriel' lastName: 'García Márquez' bornIn: 'Colombia'.
	self
		assert: person firstName equals: 'Gabriel';
		assert: person lastName equals: 'García Márquez';
		assert: person country equals: 'Colombia'