baselines
setUpGroups: spec
	spec
		package: 'BookStore-Model';
		package: 'BookStore-Systems';
		package: 'BookStore-Service' with: [ spec requires: #('BookStore-Model' 'BookStore-Persistence' 'Teapot') ];
		package: 'BookStore-Server' with: [ spec requires: #('BookStore-Service' 'Teapot') ];
		package: 'BookStore-Persistence' with: [ spec requires: #('BookStore-Model' 'GlorpDriverMySQL') ];
		package: 'BookStore-TestResource' with: [ spec requires: #('BookStore-Model') ];
		package: 'BookStore-ModelTests' with: [ spec requires: #('BookStore-Model' 'BookStore-TestResource') ];
		package: 'BookStore-SystemsTests' with: [ spec requires: #('BookStore-Persistence') ];
		package: 'BookStore-PersistenceTests' with: [ spec requires: #('BookStore-Persistence' 'BookStore-TestResource') ].
	spec
		group: 'Deployment' with: #('BookStore-Model' 'BookStore-Persistence' 'BookStore-Service' 'BookStore-Server' 'BookStore-Persistence');
		group: 'Development' with: #('Deployment' 'BookStore-ModelTests' 'BookStore-PersistenceTests' 'BookStore-PersistenceTests')