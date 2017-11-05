Accessing
configuration
	^ PersistenceConfigurator
		using: self
		creatingClassModelWith: self creationModelBlock
		creatingDescriptorModelWith: self creationDescriptorBlock
		creatingTableWith: self creationTableBlock