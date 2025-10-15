const http = require('http');
const port = process.env.PORT || 3000;
const server = http.createServer((req, res) => {
  res.end('Hello from myapp!');
});
server.listen(port, () => console.log('listening on', port));
