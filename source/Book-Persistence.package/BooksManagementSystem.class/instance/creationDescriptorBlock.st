Configuring
creationDescriptorBlock
	^ [ :aDescriptor | 
	| table |
	table := self table.
	aDescriptor  table: table.
	(aDescriptor newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(aDescriptor newMapping: DirectMapping) from: #title to: (table fieldNamed: 'title').
	(aDescriptor newMapping: DirectMapping) from: #author to: (table fieldNamed: 'author').
	(aDescriptor newMapping: DirectMapping) from: #editorial to: (table fieldNamed: 'editorial').
	(aDescriptor newMapping: DirectMapping) from: #year to: (table fieldNamed: 'year') ]