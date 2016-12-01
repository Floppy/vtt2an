require 'vtt2an'

RSpec.describe "WebVTT::Cue patches" do

  context "parsing file with no voice tags" do
    
    before :all do
      @vtt = WebVTT.read("spec/fixtures/ota.vtt")
    end

    it "should show default speaker name" do
      expect(@vtt.cues[0].speaker).to eql "Speaker"
    end

    it "should show entire text" do
      expect(@vtt.cues[0].text).to eql "I'm James Smith."
    end

    it "should have empty voice span info" do
      expect(@vtt.cues[0].voice_span).to eql []
    end
    
  end

  context "parsing file with basic voice tags" do
    
    before :all do
      @vtt = WebVTT.read("spec/fixtures/speakers.vtt")
    end

    it "should show default speaker name" do
      expect(@vtt.cues[0].speaker).to eql "Roger Bingham"
    end

    it "should show text without voice tag" do
      expect(@vtt.cues[0].text).to eql "We are in New York City"
    end

    it "should have empty voice span info" do
      expect(@vtt.cues[0].voice_span).to eql []
    end
    
  end
  
  context "parsing file with voice span tags" do
    
    before :all do
      @vtt = WebVTT.read("spec/fixtures/voice_spans.vtt")
    end

    it "should show default speaker name" do
      expect(@vtt.cues[0].speaker).to eql "Esme"
    end

    it "should show text without voice tag" do
      expect(@vtt.cues[0].text).to eql "It’s a blue apple tree!"
    end

    it "should have parsed voice span info" do
      expect(@vtt.cues[0].voice_span).to eql ["first", "loud"]
    end
    
  end
  
end