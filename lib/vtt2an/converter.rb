require 'active_support/inflector'
require 'rexml/document'

module Vtt2An

  class Converter
    
    attr_accessor :webvtt
    
    def initialize(webvtt)
      @webvtt = webvtt
    end
    
    def convert
      
      output = REXML::Document.new
      an = output.add_element("akomaNtoso")
      debate = an.add_element("debate")
      meta = debate.add_element("meta")
      references = meta.add_element("references")
            
      webvtt.speakers.each do |speaker|
        references.add_element("TLCPerson", 
          "href" => "", 
          "id" => speaker.parameterize,
          "showAs" => speaker
        )
      end

      body = debate.add_element("debateBody")
      section = body.add_element("debateSection")
      heading = section.add_element("heading")
      heading.add_text "Title"

      webvtt.merged_cues.each do |cue|
        speech = section.add_element("speech",
          "by" => "##{cue.speaker.parameterize}"
        )
        p = speech.add_element("p")
        p.add_text cue.text
      end
    
      output
    end
    
  end
  
end