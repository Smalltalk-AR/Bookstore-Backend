Connection
createLogin
	^ Login new
		database: platform;
		username: 'root';
		password: '';
		connectString: 'localhost_morfiya';
		yourself