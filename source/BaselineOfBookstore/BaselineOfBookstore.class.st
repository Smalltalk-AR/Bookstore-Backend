"
Baseline for application of books
"
Class {
	#name : #BaselineOfBookstore,
	#superclass : #BaselineOf,
	#category : 'BaselineOfBookstore'
}

{ #category : #baselines }
BaselineOfBookstore >> baseline: spec [

	<baseline>
	spec
		for: #common
		do: [ self
				setUpDependencies: spec;
				setUpGroups: spec.
			spec group: 'default' with: #('Development')
			]
]

{ #category : #baselines }
BaselineOfBookstore >> setUpDependencies: spec [

	spec
		baseline: 'ApplicationStarter'
			with: [ spec
				repository: 'github://ba-st/ApplicationStarter:v1/source';
				loads: #('Deployment')
			];
		baseline: 'Buoy'
			with: [ spec
				repository: 'github://ba-st/Buoy:v5/source';
				loads: #('Deployment')
			];
		project: 'BuoyTestExtensions' copyFrom: 'Buoy' with: [ spec loads: 'Dependent-SUnit-Extensions' ];
		baseline: 'Teapot'
			with: [ spec
				repository: 'github://zeroflag/Teapot:v2.6.0/source';
				loads: #('Deployment')
			];
		baseline: 'GlorpDriverMySQL'
			with: [ spec
				repository: 'github://apiorno/GlorpDriverMySQL:v1.0.0/source';
				loads: #('Deployment')
			]
]

{ #category : #baselines }
BaselineOfBookstore >> setUpGroups: spec [

	spec
		package: 'BookStore-Model' with: [ spec requires: #('Buoy') ];
		package: 'BookStore-Server'
			with: [ spec requires: #('BookStore-Model' 'ApplcationStarter' 'GlorpDriverMySQL' 'Teapot') ];
		package: 'BookStore-Tests' with: [ spec requires: #('BookStore-Server' 'BuoyTestExtensions') ].
	spec
		group: 'Deployment' with: #('BookStore-Model' 'BookStore-Server');
		group: 'Development' with: #('BookStore-Tests')
]
