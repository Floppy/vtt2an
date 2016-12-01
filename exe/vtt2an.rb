#!/usr/bin/env ruby
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vtt2an'

# Read the subtitle file
webvtt = WebVTT.read(ARGV[0])
# Convert
converter = Vtt2An::Converter.new(webvtt)
output = converter.convert
# Write output to file
File.open(ARGV[1], "w") do |f|
  output.write(f, 1)
end
