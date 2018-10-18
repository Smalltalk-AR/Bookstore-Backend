private - accessing
configurationDefinition

	^ Array
		with: (OptionalArgument named: #port defaultingTo: 44444 convertingWith: #asNumber)
		with:
			(OptionalArgument
				named: #'bind-address'
				defaultingTo: '0.0.0.0'
				convertingWith: [ :address | NetNameResolver addressForName: address ])