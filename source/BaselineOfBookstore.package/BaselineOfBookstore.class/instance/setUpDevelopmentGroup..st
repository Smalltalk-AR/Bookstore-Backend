baselines
setUpDevelopmentGroup: spec
	spec
		package: 'Book-ModelTests' with: [ spec requires: 'Book-Model' ];
		package: 'Book-PersistenceTests' with: [ spec requires: #('Book-Persistence') ].
	spec group: 'Development' with: #('Deployment' 'Book-ModelTests' 'Book-PersistenceTests')