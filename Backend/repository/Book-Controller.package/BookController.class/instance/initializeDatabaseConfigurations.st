Initialization
initializeDatabaseConfigurations
	bookShop := Bookstore new.
	NativeMySQLDriver beGlorpDefaultDriver.
	bookShop dropAllThenCreateSchema