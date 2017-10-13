Initialization
initialize
	super initialize.
	configurations := OrderedCollection new.
	self platform: MySQLPlatform new.
	NativeMySQLDriver beGlorpDefaultDriver .
	self connect