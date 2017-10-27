initialization
initializeToInstallOn: aRootSystem
	aRootSystem registerSystem: self.
	generalPersistenceSystem := aRootSystem persistenceSystem.
	generalPersistenceSystem addConfiguration: self configuration