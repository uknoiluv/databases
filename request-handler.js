/*global require, exports*/
var mysql = require('mysql');
var httpHelpers = require('./http-helpers');
var objectId = 1;




var dbConnection = mysql.createConnection({
  user: 'root',
  password: '',
  database: 'chat'
});

dbConnection.connect();


var data = {};
data.results = [];


var getMessages = function(request, response){
  var sqlData = dbConnection.query('select * from Messages',function(err, rows, fields){
    if (err) {
        console.log(err);
    } else {
      console.log(rows);
      httpHelpers.sendResponse(response, {results: rows} );
    }
  });
  // data.results.push(sqlData);

// dbConnection.query('select * from Friends', function(err, rows, fields){
//   if (err) throw err;
//   console.log(rows);
// });

};

var postMessage = function(request, response){
  // listen for chunks, assemble them
  httpHelpers.collectData(request, function(data){
    // parse the data
    var message = JSON.parse(data);
    objectId++;
    message.objectId = objectId;
    // push into messages
    // messages.unshift(message);
    var sqlMessage = [];
    for (var key in message) {
      sqlMessage.push(JSON.stringify(message[key]));
    }
    sqlMessage = sqlMessage.join(',');
    // console.log(sqlMessage);
    dbConnection.query( 'INSERT INTO Messages (username, text, roomname, id_users) VALUES (' + sqlMessage + ');', function(err, result) {
      if (err) {
        console.log(err);
      } else {
        // console.log('check database');
      }
    });
  });

  httpHelpers.sendResponse(response, null, 201);
};


var options = function(request, response){
  httpHelpers.sendResponse(response);
};

var actions = {
  'GET': getMessages,
  'POST': postMessage,
  'OPTIONS': options
};

exports.handler = function(request, response) {
  var action = actions[request.method];
  if( action ){
    action(request, response);
  } else {
    httpHelpers.sendResponse(response, null, 404);
  }
};
