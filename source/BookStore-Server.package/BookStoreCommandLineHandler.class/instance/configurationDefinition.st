private - accessing
configurationDefinition

	^ OrderedCollection new
		add: (OptionalArgument named: #port defaultingTo: 44444 convertingWith: #asNumber);
		add:
			(OptionalArgument
				named: #'bind-address'
				defaultingTo: '0.0.0.0'
				convertingWith: [ :address | NetNameResolver addressForName: address ]);
		add: (MandatoryArgument named: 'db-username');
		add: (OptionalArgument named: 'db-password' defaultingTo: '');
		add: (OptionalArgument named: 'db-host' defaultingTo: 'localhost');
		add: (OptionalArgument named: 'db-port' defaultingTo: 3306 convertingWith: #asNumber);
		add: (MandatoryArgument named: 'db-database');
		yourself