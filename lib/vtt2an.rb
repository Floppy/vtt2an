require "webvtt"

# Monkeypatch WebVTT::Cue
# We'll push this upstream at some point
require "vtt2an/cue"

# require vtt2an files
require "vtt2an/writer"