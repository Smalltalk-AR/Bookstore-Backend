Configuring
creationDescriptorBlock
	^ [ :aDescriptor | 
	| table |
	table := self table.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: OneToOneMapping)
		attributeName: #book;
		referenceClass: Book;
		join: (Join from: (table fieldNamed: #book_id) to: ((self relatedObjectTableNamed: #BOOK) fieldNamed: 'id')).
	(aDescriptor newMapping: OneToOneMapping)
		attributeName: #person;
		referenceClass: Person;
		join: (Join from: (table fieldNamed: #person_id) to: ((self relatedObjectTableNamed: #PERSON) fieldNamed: 'id')) ]