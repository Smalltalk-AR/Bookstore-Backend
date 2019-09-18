| branchName |

EpMonitor current disable.
Iceberg remoteTypeSelector: #httpsUrl.

branchName := Smalltalk os environment
  at: 'BRANCH_NAME'
  ifPresent: [:env | env ifEmpty: ['master'] ]
  ifAbsent: ['master'].

Metacello new
	baseline: 'Bookstore';
		githubUser: 'Smalltalk-AR'
		project: 'Bookstore-Backend'
		commitish: branchName
		path: 'source';
	load: 'Deployment'.
