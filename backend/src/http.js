const axios = require('axios');
const Agent = require('agentkeepalive');

module.exports = function (app) {
  const keepaliveAgent = new Agent({
    maxSockets: 40,
    maxFreeSockets: 10,
    timeout: 60000,
    freeSocketTimeout: 300000,
  });

  const httpClient = axios.create({
    // 60 sec timeout
    timeout: 60000,

    // keepAlive pools and reuses TCP connections, so it's faster
    // httpAgent: new http.Agent({ keepAlive: true }),
    // httpsAgent: new https.Agent({ keepAlive: true }),
    httpAgent: keepaliveAgent,
    // httpsAgent: keepaliveAgent,

    // follow up to 10 HTTP 3xx redirects
    maxRedirects: 10,

    // cap the maximum content length we'll accept to 50MBs, just in case
    maxContentLength: 50 * 1000 * 1000,
  });

  app.set('httpClient', httpClient);
};
