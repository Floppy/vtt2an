require "webvtt"

# Monkeypatch WebVTT
# We'll push this upstream at some point
require "vtt2an/webvtt/file"
require "vtt2an/webvtt/cue"

# require vtt2an files
require "vtt2an/writer"