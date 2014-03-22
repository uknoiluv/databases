/*global require */
var mysql = require('mysql');
var http = require('http');
var messageHandler = require('../request-handler');
var httpHelpers = require('../http-helpers');
var url = require('url');
/* If the node mysql module is not found on your system, you may
 * need to do an 'sudo npm install -g mysql'. */

/* You'll need to fill the following out with your mysql username and password.
 * database: 'chat' specifies that we're using the database called
 * 'chat', which we created by running schema.sql.*/
var dbConnection = mysql.createConnection({
  user: 'root',
  password: '',
  database: 'chat'
});

dbConnection.connect();
dbConnection.query('insert into Friends set users = "adrian"', function(){

});
dbConnection.query('select * from Friends', function(err, rows, fields){
  if (err) throw err;
  console.log(rows);
  // console.log('hello');
});




/* Every server needs to listen on a port with a unique number. The
 * standard port for HTTP servers is port 80, but that port is
 * normally already claimed by another server and/or not accessible
 * so we'll use a higher port number that is not likely to be taken: */
var port = 3000;

/* For now, since you're running this server on your local machine,
 * we'll have it listen on the IP address 127.0.0.1, which is a
 * special address that always refers to localhost. */
var ip = '127.0.0.1';

var routes = {
  '/classes/messages': messageHandler.handler,
  '/classes/users': messageHandler.handler // userHandler.handler
};

var router = function(request, response) {
  console.log('Serving request type ' + request.method + ' for url ' + request.url);

  var parsedUri = url.parse(request.url);

  var route = routes[parsedUri.pathname];
  if( route ){
    route(request, response);
  } else {
    httpHelpers.sendResponse(response, null, 404);
  }
};

var server = http.createServer(router);
console.log('Listening on http://' + ip + ':' + port);
server.listen(port, ip);
/* Now you can make queries to the Mysql database using the
 * dbConnection.query() method.
 * See https://github.com/felixge/node-mysql for more details about
 * using this module.*/

/* You already know how to create an http server from the previous
 * assignment; you can re-use most of that code here. */
