Initialization
initialize
	super initialize.
	self platform: MySQLPlatform  new.
	NativeMySQLDriver beGlorpDefaultDriver.
	self connect



