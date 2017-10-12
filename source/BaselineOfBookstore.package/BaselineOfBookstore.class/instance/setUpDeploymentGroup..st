baselines
setUpDeploymentGroup: spec
	spec
		package: 'Book-Model';
		package: 'Book-Controller' with: [ spec requires: #('Book-Model' 'Book-Persistence' 'Teapot') ];
		package: 'Book-Persistence' with: [ spec requires: #('Book-Model' 'GlorpDriverMySQL') ].
	spec group: 'Deployment' with: #('Book-Model' 'Book-Controller' 'Book-Persistence')