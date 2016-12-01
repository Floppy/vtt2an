#!/usr/bin/env ruby
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vtt2an'

# Read the subtitle file
webvtt = WebVTT.read(ARGV[0])
# Write the output
writer = Vtt2An::Writer.new(webvtt)
writer.write