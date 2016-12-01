require 'active_support/inflector'

module Vtt2An

  class Converter
    
    attr_accessor :webvtt
    
    def initialize(webvtt)
      @webvtt = webvtt
    end
    
    def convert

      str = %Q{
      <akomaNtoso>
        <debate>
          <meta>
            <references>
      }
      webvtt.speakers.each do |speaker|
        str += "        <TLCPerson href=\"\" id=\"#{speaker.parameterize}\" showAs=\"#{speaker}\"/>"
      end
      str += %Q{
            </references>
          </meta>
          <debateBody>
            <debateSection>        
              <heading>Title</heading>
      }
      last_speaker = nil
      webvtt.cues.each do |cue|
        if cue.speaker != last_speaker
          str += "          </p>"
          str += "        </speech>" unless last_speaker.nil?
          str += "        <speech by=\"##{cue.speaker.parameterize}\">"
          str += "          <p>"
          last_speaker = cue.speaker
        end
        str += cue.text + " "
      end
      str += %Q{
                </p>
              </speech>
            </debateSection>
          </debateBody>
        </debate>
      </akomaNtoso>
      }
      str   
    end
    
  end
  
end