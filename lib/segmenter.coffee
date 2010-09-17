{spawn} = require 'child_process'
sys = require 'sys'

module.exports = (stream) ->
  segmentLength = 4
  folder = 'public/stream'
  prefix = 'fileSequence'
  preset = 'ep_512k'

  process = spawn 'vendor/segmenter/live_segmenter', [segmentLength, folder, prefix, preset]

  sys.pump stream, process.stdin
