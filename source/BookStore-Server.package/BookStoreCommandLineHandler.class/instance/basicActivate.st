private - accessing
basicActivate

	BookStoreInterface
		toDeployOnAdress: (self configuration at: #'bind-address')
		andPort: (self configuration at: #port)