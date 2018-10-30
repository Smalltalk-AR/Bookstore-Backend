Extension { #name : #Person }

{ #category : #'*BookStore-Service' }
Person class >> fromJson: aNeoJSon [

	^ (self
		named: (aNeoJSon at: #firstName)
		lastName: (aNeoJSon at: #lastName)
		bornIn: (aNeoJSon at: #country))
		id: (aNeoJSon at: #id);
		yourself
]

{ #category : #'*BookStore-Service' }
Person class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | mapping mapInstVars: #(id firstName lastName country) ]
]
