private - accessing
configureDatabaseLogin

	RDBPersistenceSystem current
		login:
			(Login new
				username: (self configuration at: #'db-username');
				password: (self configuration at: #'db-password');
				port: (self configuration at: #'db-port');
				connectString: (self configuration at: #'db-host') , '_' , (self configuration at: #'db-database');
				yourself)