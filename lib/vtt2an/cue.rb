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