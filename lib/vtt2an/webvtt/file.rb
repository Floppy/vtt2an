class WebVTT::File

  def speakers
    cues.map{|x|x.speaker}.uniq
  end
  
  def merged_cues
    merged = []
    last_speaker = nil
    cues.each do |input_cue|
      if input_cue.speaker != last_speaker
        merged.last.parse unless merged.empty?
        merged << WebVTT::Cue.new(input_cue.instance_variable_get(:@content))
      else
        merged.last.instance_variable_set(:@content, "#{merged.last.instance_variable_get(:@content)} #{input_cue.text}")
      end
      last_speaker = input_cue.speaker
    end
    merged.last.parse unless merged.empty?
    merged
  end
  
end