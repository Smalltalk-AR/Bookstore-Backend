RDB-Protocol
createLogin
	^ Login new
		database: platform;
		username: 'root';
		password: 'root';
		connectString: 'localhost_books';
		yourself