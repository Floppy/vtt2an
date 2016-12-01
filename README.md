# vtt2an

[![Build Status](http://img.shields.io/travis/Floppy/vtt2an.svg?style=flat-square)](https://travis-ci.org/Floppy/vtt2an)
[![Dependency Status](http://img.shields.io/gemnasium/github.com/Floppy/vtt2an.svg?style=flat-square)](https://gemnasium.com/github.com/Floppy/vtt2an)
[![Coverage Status](http://img.shields.io/coveralls/Floppy/vtt2an.svg?style=flat-square)](https://coveralls.io/r/Floppy/vtt2an)
[![Code Climate](http://img.shields.io/codeclimate/github/Floppy/vtt2an.svg?style=flat-square)](https://codeclimate.com/github/Floppy/vtt2an)
[![Gem Version](http://img.shields.io/gem/v/vtt2an.svg?style=flat-square)](https://rubygems.org/gems/vtt2an)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://Floppy.mit-license.org)

Convert WebVTT subtitles files into Akoma Ntoso transcripts.

## Installation

Ruby 2.3.1 recommended, then:

`gem install vtt2an`

or add to your Gemfile:

`gem "vtt2an"`

and then

`bundle`

## Usage

### Ruby

Load a WebVTT file using [webvtt-ruby](https://github.com/opencoconut/webvtt-ruby), then convert it using `Vtt2An::Converter` to a `REXML::Document` in Akoma Ntoso format:

```
webvtt = WebVTT.read "in.wtt"
converter = Vtt2An::Converter.new webvtt
output = converter.convert
File.open("out.an", "w") do |f|
  output.write f
end
```

### Command line

If you just want to convert files, you can use the handy command-line tool:

`bundle exec exe/vtt2an.rb /path/to/file.vtt /path/to/output.an`