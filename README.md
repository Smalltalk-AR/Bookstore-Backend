# Bookstore - Backend [![Build Status](https://travis-ci.org/Smalltalk-AR/Bookstore-Backend.svg?branch=master)](https://travis-ci.org/Smalltalk-AR/Bookstore-Backend)

## Installing
  - Execute in Playground:

  ```smalltalk
Metacello new 
	baseline: 'Bookstore';
	githubUser: 'Smalltalk-AR' 
	project: 'Bookstore-Backend' 
	commitish: 'master' 
	path: 'source';
	load 
  ```
  
## Run application
  #### Persistence:
  The application connects to MySQL.

  By default connect to DB named 'Bookstore' on localhost using username "root" and empty password. This are defined in *RDBPersistenceSystem>>#createLogin* and can be changed.
  
  #### StartUp server
  Server start de DB connection and api rest.
  - A simple way to StartUp is ```BookStoreRunner startDeployingDefault```, on this case the server will be deployed on the port 1710 of 127.0.0.1 (localhost).
  - Custom way to StartUp is using:
  ```
  BookStoreRunner deploying: BookstoreInstallation new onAdress: #[127 0 0 1] andPort: 1710
  ```
  
  ### OBS
  - This project is compatible with Pharo version 6.1.

  - When the server is started, the tables in the DB are dropped and created again.
    See message _#dropAllThenCreateSchema_.
