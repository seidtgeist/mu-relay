encoding  = require 'encoding'
httpGet   = require 'httpGet'
segmenter = require 'segmenter'

express = require 'express'
fs      = require 'fs'
sys     = require 'sys'

app = express.createServer(
  express.logger({format: ':method :url'})
  express.staticProvider(__dirname + '/public')
)

# Start encoding
httpGet 'http://videos.mozilla.org/firefox/3.6/getpersonas.mp4', (videoStream) ->
  encoding.video videoStream, (encodedStream) ->
    segmenter encodedStream

# Web app
app.configure ->
  app.set 'view engine', 'jade'

app.get '/', (req, res) ->
  res.render 'index'

app.get '/playlist.m3u8', (req, res) ->
  fs.readdir 'public/stream', (err, files) ->
    completedFiles = files.filter((file) -> file.match /ts$/ ).splice(0, files.length-1).sort()
    res.render 'playlist.ejs',
      layout: false,
      locals: {files: completedFiles}

app.listen 3000, '0.0.0.0'
