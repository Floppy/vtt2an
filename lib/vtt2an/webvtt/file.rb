class WebVTT::File

  def speakers
    cues.map{|x|x.speaker}.uniq
  end
  
end