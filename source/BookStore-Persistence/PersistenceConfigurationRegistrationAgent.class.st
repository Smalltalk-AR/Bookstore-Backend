"
.
"
Class {
	#name : #PersistenceConfigurationRegistrationAgent,
	#superclass : #Object,
	#instVars : [
		'persistenceSystem'
	],
	#category : 'BookStore-Persistence'
}

{ #category : #'as yet unclassified' }
PersistenceConfigurationRegistrationAgent class >> toRegisterIn: aPersistenceSystem [

	^self new initializeToRegisterIn: aPersistenceSystem
]

{ #category : #initialization }
PersistenceConfigurationRegistrationAgent >> initializeToRegisterIn: aPersistenceSystem [

	persistenceSystem := aPersistenceSystem
]

{ #category : #initialization }
PersistenceConfigurationRegistrationAgent >> registerConfigurationFor: aModule [
	"Estaria bueno que quede algo asi, desglozando el configuration en esas partes para poder ofrecer varios tambien. -apiorno"

	"aModule tableDefinitions
		do: [:definition | persistenceSystem beAwareOfTableDefinedBy: definition].
	aModule classModelDefinitions
		do: [:definition | persistenceSystem beAwareOfClassModelDefinedBy: definition].
	aModule descriptorDefinitions
		do: [:definition | persistenceSystem beAwareOfDescriptorDefinedBy: definition].
	aModule typeResolverDefinitions
		do: [:definition | persistenceSystem beAwareOfTypeResolverDefinedBy: definition]"

	aModule configurations do: [ :each | persistenceSystem addConfiguration: each ]
]
