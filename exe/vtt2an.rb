#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
require 'vtt2an'

# Read the subtitle file
webvtt = WebVTT.read(ARGV[0])
# Write the output
writer = Vtt2An::Writer.new(webvtt)
writer.write