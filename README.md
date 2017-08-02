# Bookstore
*A CRUD Web Application of a Bookstore.*
*Frontend:*
 *-Angular Framework with Jquery, Bootstrap,etc.*
*Backend:*
 *-Smalltalk as programming language and Pharo 5.0 as Dialect.*
 *-Teapot and Zinc frameworks for server and routes*
 *-Glorp and MySql for Persistence.*

##Installation / Instructions
### Teapot Installation (Rest Routes Framework)
Execute the code in **Playground**:

```Smalltalk
Gofer it
    smalltalkhubUser: 'zeroflag' project: 'Teapot';
    configuration;
    loadStable.
```

### Glorp Installation (Persistence) 
Execute the code in **Playground**:

```Smalltalk
Gofer it
	smalltalkhubUser: 'DBXTalk' project: 'Glorp';
	configurationOf: 'Glorp';
	loadVersion: '1.10'.
```

### Driver MySql Installation
Execute the code in **Playground**:

```Smalltalk
Gofer new
	smalltalkhubUser: 'ThomasHeniart' project: 'GlorpDriverMySQL';
	configurationOf: 'GlorpDriverMySQL';
	loadVersion: #bleedingEdge.
```
### Application Installation
Add the application in Pharo Image via Filetree/ gitFiletree.

To run backend server execute this code in **Playground**:

```Smalltalk
|controller|
controller := BookController  new.
controller start.
```
*This drops and creates all tables , so if you restart server all data will be lost (this can be changed, obviously)*

Now download dependencies of frontend using:
**npm install** being at **package.json** directory.
 
Then you must start a server for Frontend (for example http-server from Node) and starts at the Frontend directory using:
* http-server -p 8081*

*Now from browser: localhost:8081*
