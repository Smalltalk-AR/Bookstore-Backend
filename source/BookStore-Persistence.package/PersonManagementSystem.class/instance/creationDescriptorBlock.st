Configuring
creationDescriptorBlock

	^ [ :aDescriptor | 
	| table |
	table := self table.
	aDescriptor table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #firstName to: (table fieldNamed: 'firstName').
	(aDescriptor newMapping: DirectMapping) from: #lastName to: (table fieldNamed: 'lastName').
	(aDescriptor newMapping: DirectMapping) from: #country to: (table fieldNamed: 'country').
	(aDescriptor newMapping: OneToManyMapping)
		from: #books to: (table fieldNamed: 'books_id');
		join: (Join from: (table fieldNamed: #id) to: ((self relatedObjectTableNamed: 'BOOK') fieldNamed: 'person_id')) ]