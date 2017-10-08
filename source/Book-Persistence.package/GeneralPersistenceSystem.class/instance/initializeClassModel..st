Configuration
initializeClassModel: aClassModel
	configurations
		detect: [ :configuration | configuration describedClass = aClassModel describedClass ]
		ifFound: [ :configuration | configuration configClassModel: aClassModel ]
		ifNone: [  ].
	"Otherwise, just initialize it dynamically, so that old code with only descriptors will still work"
	^ aClassModel