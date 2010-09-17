{spawn} = require 'child_process'
sys = require 'sys'
ipadPreset = require 'presets/ipad'

ffmpeg = module.exports.ffmpeg = (preset, stream, callback) ->
  presetOpts = (["-#{k}", v] for k, v of preset).reduce (all, one) -> all.concat one, []
  encodingParams = [].concat ['-i', '-'], presetOpts, ['pipe:1']
  encoder = spawn 'ffmpeg', encodingParams
  sys.pump stream, encoder.stdin
  callback encoder.stdout

module.exports.video = (stream, callback) ->
  ffmpeg ipadPreset, stream, callback

module.exports.audio = (stream, callback, startingSecond, duration) ->
  ffmpeg {
    ab: "128k"
    ac: "2"
    acodec: "libmp3lame"
    ar: "48000"
    format: "mp3"
  }, stream, callback
