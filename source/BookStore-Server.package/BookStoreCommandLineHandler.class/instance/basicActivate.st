private - accessing
basicActivate

	self configureDatabaseLogin.
	(BookStoreInterface
		toDeployOnAdress: (self configuration at: #'bind-address')
		andPort: (self configuration at: #port)) start