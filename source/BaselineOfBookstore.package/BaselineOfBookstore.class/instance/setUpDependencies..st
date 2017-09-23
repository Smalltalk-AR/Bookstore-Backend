baselines
setUpDependencies: spec
	spec
		configuration: 'Teapot'
		with: [ spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/zeroflag/Teapot/main' ].
	spec
		configuration: 'Glorp'
		with: [ spec
				versionString: #stable;
				repository: 'http://www.smalltalkhub.com/mc/DBXTalk/Configurations/main' ]