Configuration
initializeDescriptor: aDescriptor
	configurations
		detect: [ :configuration | configuration describedClass = aDescriptor describedClass ]
		ifFound: [ :configuration | configuration configDescriptor: aDescriptor ]
		ifNone: [ self noDescriptorInitializerFound: aDescriptor ]