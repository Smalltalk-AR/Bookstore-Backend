"
System that knows how to persist objects
"
Class {
	#name : #RDBPersistenceSystem,
	#superclass : #DescriptorSystem,
	#instVars : [
		'glorpSession',
		'connectionFailed',
		'configurations',
		'parentHolder',
		'login'
	],
	#classVars : [
		'Current'
	],
	#category : 'BookStore-Persistence'
}

{ #category : #private }
RDBPersistenceSystem class >> implementedInterface [
	"Se agrega este mensaje por compatibilidad con sistemas de Kepler."

	 ^SystemInterface >> #PersistenceSystemInterface
]

{ #category : #accessing }
RDBPersistenceSystem class >> new [

	^ self basicNew initialize
]

{ #category : #Query }
RDBPersistenceSystem >> add: anObject [

	self glorpSession inUnitOfWorkDo: [ self glorpSession register: anObject ].
	^anObject
]

{ #category : #Configuration }
RDBPersistenceSystem >> addConfiguration: aConfiguration [
	configurations add: aConfiguration
]

{ #category : #Query }
RDBPersistenceSystem >> allOf: aClass [

	^ self glorpSession read: aClass
]

{ #category : #'DB-Creation' }
RDBPersistenceSystem >> allTableNames [
	^ configurations collect: #tableName
]

{ #category : #Connection }
RDBPersistenceSystem >> connect [
	| accessor |
	accessor := DatabaseAccessor forLogin: login.
	glorpSession := StatelessApplicationGlorpSession forSystem: self.
	glorpSession accessor: accessor.
	connectionFailed := false.
	[ accessor login ] ifError: [ :err | connectionFailed := true ]
]

{ #category : #Configuration }
RDBPersistenceSystem >> constructClassesFromDescriptorMethods [
	allClasses addAll: (configurations collect: #describedClass)
]

{ #category : #Query }
RDBPersistenceSystem >> countOf: aClass [
	^ self glorpSession count: aClass
]

{ #category : #'DB-Creation' }
RDBPersistenceSystem >> createAllSequences [
	self platform areSequencesExplicitlyCreated
		ifTrue: [ self allSequences
				do: [ :each | 
					self glorpSession accessor
						createSequence: each
						ifError: [ :error | Transcript show: error messageText ] ] ]
]

{ #category : #'DB-Creation' }
RDBPersistenceSystem >> createAllTables [
	| accessor errorBlock |
	accessor := self glorpSession accessor.
	errorBlock := [ :errorx | Transcript show: errorx messageText ].
	self allTables
		do: [ :each | accessor createTable: each ifError: errorBlock ];
		do: [ :each | accessor createTableIndexes: each ifError: errorBlock ];
		do: [ :each | accessor createTableFKConstraints: each ifError: errorBlock ]
]

{ #category : #Connection }
RDBPersistenceSystem >> createLogin [
	^ Login new
		database: platform;
		username: 'root';
		password: '';
		connectString: 'localhost_Bookstore';
		yourself
]

{ #category : #Connection }
RDBPersistenceSystem >> disconnect [
	glorpSession ifNotNil: [ glorpSession accessor logout ]
]

{ #category : #'DB-Creation' }
RDBPersistenceSystem >> dropAllTables [
	self glorpSession accessor dropTables: self allTables
]

{ #category : #'DB-Creation' }
RDBPersistenceSystem >> dropAllThenCreateSchema [
	self
		dropAllTables;
		createAllSequences;
		createAllTables
]

{ #category : #Query }
RDBPersistenceSystem >> findOneOf: aClass satisfying: aCondition [
	^ self glorpSession readOneOf: aClass where: aCondition
]

{ #category : #Accessing }
RDBPersistenceSystem >> glorpSession [

	^glorpSession  
	
]

{ #category : #Accessing }
RDBPersistenceSystem >> glorpSession: aGlorpSession [
	glorpSession := aGlorpSession
]

{ #category : #Connection }
RDBPersistenceSystem >> implements: aSystemInterface [
	"Se agrega este mensaje por compatibilidad con sistemas de Kepler."

	^ self class implementedInterface = aSystemInterface 
]

{ #category : #Initialization }
RDBPersistenceSystem >> initialize [
	super initialize.
	configurations := OrderedCollection new.
	self platform: MySQLPlatform new.
	NativeMySQLDriver  beGlorpDefaultDriver .
	parentHolder := Binding
		undefinedExplainedBy: 'El subsistema no se encuentra registrado en ningún sistema raíz.'.
	login := self createLogin.
]

{ #category : #Configuration }
RDBPersistenceSystem >> initializeClassModel: aClassModel [
	configurations
		detect: [ :configuration | configuration describedClass = aClassModel describedClass ]
		ifFound: [ :configuration | configuration configClassModel: aClassModel ]
		ifNone: [  ].
	"Otherwise, just initialize it dynamically, so that old code with only descriptors will still work"
	^ aClassModel
]

{ #category : #Configuration }
RDBPersistenceSystem >> initializeDescriptor: aDescriptor [
	configurations
		detect: [ :configuration | configuration describedClass = aDescriptor describedClass ]
		ifFound: [ :configuration | configuration configDescriptor: aDescriptor ]
		ifNone: [ self noDescriptorInitializerFound: aDescriptor ]
]

{ #category : #Configuration }
RDBPersistenceSystem >> initializeTable: newTable [
	configurations
		detect: [ :configuration | configuration tableName = newTable name ]
		ifFound: [ :configuration | configuration configTable: newTable ]
		ifNone: [ self noTableInitializerFound: newTable ].
	newTable postInitializeIn: self
]

{ #category : #Initialization }
RDBPersistenceSystem >> login: aLogin [

	login := aLogin
		database: platform;
		yourself
]

{ #category : #Connection }
RDBPersistenceSystem >> parent [
	"Se agrega este mensaje por compatibilidad con sistemas de Kepler."

	^ parentHolder content
]

{ #category : #Connection }
RDBPersistenceSystem >> parent: aCompositeSystem [
	"Se agrega este mensaje por compatibilidad con sistemas de Kepler."

	parentHolder := Binding to: aCompositeSystem
]

{ #category : #Query }
RDBPersistenceSystem >> remove: anObject [
	self glorpSession inUnitOfWorkDo: [ self glorpSession delete: anObject ].
	^ anObject
]

{ #category : #Connection }
RDBPersistenceSystem >> shutDown [
	"Se agrega este mensaje por compatibilidad con sistemas de Kepler."
	self disconnect
]

{ #category : #Connection }
RDBPersistenceSystem >> startUp [
	"Se agrega este mensaje por compatibilidad con sistemas de Kepler."
	self connect.
	self dropAllThenCreateSchema
]

{ #category : #Query }
RDBPersistenceSystem >> update: anObject with: anotherObject [
	self glorpSession
		inUnitOfWorkDo: [ anObject synchronizeWith: anotherObject.
			self glorpSession register: anObject ].
		^anObject 
]
