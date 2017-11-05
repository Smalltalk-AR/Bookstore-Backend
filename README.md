# Bookstore - Backend

## Installing
  - Execute in Playground:

  ```smalltalk
  Metacello new
  baseline: 'Bookstore';
  repository: 'github://Smalltalk-AR/Bookstore-Backend:master/source';
  load
  ```
## Run application
  #### Persistence:
  The application connects to MySQL.

  By default connect to DB named 'Bookstore' on localhost using username "root" and empty password. This are defined in *GeneralPersistenceSystem>>#createLogin* and can be changed.
  #### StartUp server
  Server start de DB connection and api rest.
  - A simple way to StartUp is ```BookStoreInterface start```, on this case deploy a server on 127.0.0.1 (localhost) and port 1710.
  - Custom way to StartUp is using
  ```
  BookStoreInterface toDeployOnAdress: #[127 0 0 1] andPort: 1710
  ```
  ### OBS
  When the server is started, the tables in the DB are dropped and created again.
  See message _#dropAllThenCreateSchema_.
