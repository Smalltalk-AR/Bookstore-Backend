baselines
setUpGroups: spec
	spec
		package: 'Book-Model';
		package: 'Book-Controller' with: [ spec requires: #('Book-Model' 'Glorp' 'Teapot') ];
		package: 'Book-Tests' with: [ spec requires: 'Book-Model' ].
	spec
		group: 'Deployment' with: #('Book-Model' 'Book-Controller');
		group: 'Development' with: #('Deployment' 'Book-Tests')