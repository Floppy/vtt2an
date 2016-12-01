class WebVTT::Cue

  VOICE_SPAN_REGEX = /<v\.?([\w\.]*?) (.*?)\>(.*)/
  
  def speaker 
    raw_text =~ VOICE_SPAN_REGEX
    $2 || "Speaker"
  end
  
  alias_method :raw_text, :text
  
  def text
    raw_text =~ VOICE_SPAN_REGEX
    $3 || raw_text
  end
  
  def voice_span
    raw_text =~ VOICE_SPAN_REGEX
    if $1
      $1.split(".")
    else
      []
    end
  end
  
end