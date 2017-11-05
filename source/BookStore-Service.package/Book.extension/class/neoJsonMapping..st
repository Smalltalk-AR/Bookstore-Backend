*BookStore-Service
neoJsonMapping: mapper
	mapper for: self do: [ :mapping | mapping mapInstVars: #(id title editorial releaseYear author) ]