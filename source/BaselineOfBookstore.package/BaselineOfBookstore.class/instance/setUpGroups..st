baselines
setUpGroups: spec
	spec
		package: 'BookStore-Model';
		package: 'BookStore-Service' with: [ spec requires: #('BookStore-Model' 'BookStore-Persistence' 'Teapot') ];
		package: 'BookStore-Persistence' with: [ spec requires: #('BookStore-Model' 'GlorpDriverMySQL') ];
		package: 'BookStore-ModelTests' with: [ spec requires: 'BookStore-Model' ];
		package: 'BookStore-PersistenceTests' with: [ spec requires: #('BookStore-Persistence') ].
	spec
		group: 'Deployment' with: #('BookStore-Model' 'BookStore-Service' 'BookStore-Persistence');
		group: 'Development' with: #('Deployment' 'BookStore-ModelTests' 'BookStore-PersistenceTests')