Instance Creation
glorpSetupDescriptor: aDescriptor forSystem: aDescriptorSystem
	| table |
	table := aDescriptorSystem tableNamed: #BOOK.
	aDescriptor
		table: table;
		addMapping: (DirectMapping from: #id to: (table fieldNamed: #id));
		addMapping: (DirectMapping from: #title to: (table fieldNamed: #title));
		addMapping: (DirectMapping from: #author to: (table fieldNamed: #author));
		addMapping: (DirectMapping from: #editorial to: (table fieldNamed: #editorial));
		addMapping: (DirectMapping from: #year to: (table fieldNamed: #year))