initialization-service
initializeAllObjectsService
	server GET: (self fullPath) -> [ :req | controller getAll ]