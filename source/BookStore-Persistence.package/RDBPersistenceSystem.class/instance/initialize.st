Initialization
initialize

	super initialize.
	configurations := OrderedCollection new.
	self platform: MySQLPlatform new.
	NativeMySQLDriver beGlorpDefaultDriver.
	login := Login new
		database: platform;
		username: 'root';
		password: '';
		connectString: 'localhost_Bookstore';
		yourself