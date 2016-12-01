#!/usr/bin/env ruby

require "webvtt"
require 'active_support/inflector'

webvtt = WebVTT.read(ARGV[0])

class WebVTT::Cue
  
  def speaker 
    text =~ /<v[\w\.]*? (.*?)\>(.*)/
    $1 || "Speaker"
  end
  
  def filtered_text
    text =~ /<v[\w\.]*? (.*?)\>(.*)/
    $2 || text
  end
  
end

# Find all speakers
speakers = webvtt.cues.map{|x|x.speaker}.uniq

puts <<EOF
<akomaNtoso>
  <debate>
    <meta>
      <references>
EOF
speakers.each do |speaker|
  puts "        <TLCPerson href=\"\" id=\"#{speaker.parameterize}\" showAs=\"#{speaker}\"/>"
end
puts <<EOF
      </references>
    </meta>
    <debateBody>
      <debateSection>        
        <heading>Title</heading>
EOF
last_speaker = nil
webvtt.cues.each do |cue|
  if cue.speaker != last_speaker
    puts "          </p>"
    puts "        </speech>" unless last_speaker.nil?
    puts "        <speech by=\"##{cue.speaker.parameterize}\">"
    print "          <p>"
    last_speaker = cue.speaker
  end
  print cue.filtered_text + " "
end
puts <<EOF
          </p>
        </speech>
      </debateSection>
    </debateBody>
  </debate>
</akomaNtoso>
EOF