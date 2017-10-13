Actions
removeBookOfId: anId
	^ TeaResponse ok
		body: (booksManagementSystem removeBookOfId: anId);
		headers: self normalHeaders