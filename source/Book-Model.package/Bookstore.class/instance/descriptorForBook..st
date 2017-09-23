Book-Configuration
descriptorForBook: description
	| table |
	table := self tableNamed: 'Book'.
	description table: table.
	(description newMapping: DirectMapping) from: #id to: (table fieldNamed: 'id').
	(description newMapping: DirectMapping) from: #title to: (table fieldNamed: 'title').
	(description newMapping: DirectMapping) from: #author to: (table fieldNamed: 'author').
	(description newMapping: DirectMapping) from: #editorial to: (table fieldNamed: 'editorial').
	(description newMapping: DirectMapping) from: #year to: (table fieldNamed: 'year')