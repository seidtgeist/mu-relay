Mu Relay
========

Install
-------

You need ffmpeg including libavformat headers.
The segmenter is bundled from [this repo](http://github.com/carsonmcdonald/HTTP-Live-Video-Stream-Segmenter-and-Distributor) and you need to build it first:

    cd vendor/segmenter
    make

Dependencies
------------

* Node 0.2.x
* ExpressJS
* ejs
* ffmpeg
* live_segmenter