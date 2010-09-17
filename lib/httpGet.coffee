http = require 'http'
url  = require 'url'

module.exports = (urlStr, callback) ->
  parsedUrl = url.parse(urlStr)
  client = http.createClient (parsedUrl.port || 80), parsedUrl.hostname
  request = client.request 'GET', parsedUrl.pathname, {'host': parsedUrl.host}
  request.end()
  request.on 'response', (response) ->
    callback response
