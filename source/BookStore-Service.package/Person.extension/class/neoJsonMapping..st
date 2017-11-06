*BookStore-Service
neoJsonMapping: mapper
	mapper for: self do: [ :mapping | mapping mapInstVars: #(id firstName lastName country books) ]