var serial = require('serialport');
var port = new serial('/dev/cu.usbmodem1411', {
	baudRate: 9600
});

var output = document.getElementById('leapPane')


port.on('open', function() {
  
});

port.on('data', function (data) {
  console.log('Data: ' + data);
});

// open errors will be emitted as an error event
port.on('error', function(err) {
  console.log('Error: ', err.message);
})