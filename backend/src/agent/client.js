const feathers = require('@feathersjs/client');
const io = require('socket.io-client');

const url = 'http://localhost:3030';

const client = feathers();
const socket = io(url, {
  transports: ['websocket'],
  upgrade: false,
});
const transport = feathers.socketio(socket, {
  timeout: 30000,
});

client.configure(transport);

module.exports = client;
