baselines
setUpGroups: spec
	spec
		package: 'Book-Model';
		package: 'Book-Controller' with: [ spec requires: #('Book-Model' 'Book-Persistence' 'Teapot') ];
		package: 'Book-Persistence' with: [ spec requires: #('Book-Model' 'GlorpDriverMySQL') ];
		package: 'Book-ModelTests' with: [ spec requires: 'Book-Model' ];
		package: 'Book-PersistenceTests' with: [ spec requires: #('Book-Persistence') ].
	spec
		group: 'Deployment' with: #('Book-Model' 'Book-Controller' 'Book-Persistence');
		group: 'Development' with: #('Deployment' 'Book-ModelTests' 'Book-PersistenceTests')