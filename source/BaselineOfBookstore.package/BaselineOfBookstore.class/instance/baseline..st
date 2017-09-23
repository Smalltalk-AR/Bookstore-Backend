baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ self setUpDependencies: spec.
			spec
				package: 'Book-Model';
				package: 'Book-Tests' with: [ spec requires: 'Book-Model' ].
			spec
				group: 'Deployment' with: #('Book-Model');
				group: 'Development' with: #('Deployment' 'Book-Tests');
				group: 'default' with: #('Development') ]