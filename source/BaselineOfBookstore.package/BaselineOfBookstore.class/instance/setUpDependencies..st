baselines
setUpDependencies: spec

	spec
		baseline: 'ApplicationStarter'
			with: [ spec
				repository: 'github://ba-st/ApplicationStarter:v1.0.0/source';
				loads: #('Deployment') ];
		import: 'ApplicationStarter'.
	spec
		configuration: 'Teapot'
		with: [ spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/zeroflag/Teapot/main' ].
	spec
		baseline: 'GlorpDriverMySQL'
		with: [ spec
				repository: 'github://apiorno/GlorpDriverMySQL:master/source';
				loads: #('Deployment') ]