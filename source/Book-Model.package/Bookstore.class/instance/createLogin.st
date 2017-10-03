RDB-Protocol
createLogin
	^ Login new
		database: platform;
		username: 'root';
		password: '';
		connectString: 'localhost_books';
		yourself