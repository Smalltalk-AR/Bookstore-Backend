"
Baseline for application of books
"
Class {
	#name : #BaselineOfBookstore,
	#superclass : #BaselineOf,
	#category : #BaselineOfBookstore
}

{ #category : #baselines }
BaselineOfBookstore >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self
					setUpDependencies: spec;
					setUpGroups: spec.
				spec group: 'default' with: #('Development') ]
]

{ #category : #baselines }
BaselineOfBookstore >> setUpDependencies: spec [

	spec
		baseline: 'ApplicationStarter'
			with: [ spec
				repository: 'github://ba-st/ApplicationStarter:v1.0.0/source';
				loads: #('Deployment') ];
		baseline: 'Kepler'
		with: [ spec
				repository: 'github://ba-st/Kepler:v2.0.4/source';
				loads: #('Deployment') ];
		configuration: 'Teapot'
		with: [ spec
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/zeroflag/Teapot/main' ];
		baseline: 'GlorpDriverMySQL'
		with: [ spec
				repository: 'github://apiorno/GlorpDriverMySQL:master/source';
				loads: #('Deployment') ]
]

{ #category : #baselines }
BaselineOfBookstore >> setUpGroups: spec [
	spec
		package: 'BookStore-Model';
		package: 'BookStore-Installation';
		package: 'BookStore-Systems' with: [ spec requires: #('BookStore-Server' 'Kepler')];
		package: 'BookStore-Service' with: [ spec requires: #('BookStore-Model' 'BookStore-Persistence' 'Teapot') ];
		package: 'BookStore-Server' with: [ spec requires: #('BookStore-Service' 'ApplicationStarter') ];
		package: 'BookStore-Persistence' with: [ spec requires: #('BookStore-Model' 'GlorpDriverMySQL') ];
		package: 'BookStore-PersistenceModules' with:[ spec requires: #('BookStore-Persistence')];
		package: 'BookStore-TestResource' with: [ spec requires: #('BookStore-Model') ];
		package: 'BookStore-ModelTests' with: [ spec requires: #('BookStore-Model' 'BookStore-TestResource') ];
		package: 'BookStore-PersistenceTests' with: [ spec requires: #('BookStore-Persistence' 'BookStore-TestResource') ].
	spec
		group: 'Deployment' with: #('BookStore-Model' 'BookStore-Installation' 'BookStore-Systems' 'BookStore-Persistence' 'BookStore-Service' 'BookStore-Server' 'BookStore-PersistenceModules');
		group: 'Development' with: #('Deployment' 'BookStore-ModelTests' 'BookStore-PersistenceTests')

]
