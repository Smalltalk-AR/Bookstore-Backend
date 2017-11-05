Query
findOneOf: aClass satisfying: aCondition
	^ self glorpSession readOneOf: aClass where: aCondition