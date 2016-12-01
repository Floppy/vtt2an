require 'vtt2an'

RSpec.describe "WebVTT patches" do

  context "getting list of speakers" do
    
    it "from file without speakers" do
      @vtt = WebVTT.read("spec/fixtures/ota.vtt")
      expect(@vtt.speakers).to eql ["Speaker"]
    end

    it "from file with speakers" do
      @vtt = WebVTT.read("spec/fixtures/speakers.vtt")
      expect(@vtt.speakers).to eql ["Roger Bingham", "Neil deGrasse Tyson"]
    end

    it "from file with voice spans" do
      @vtt = WebVTT.read("spec/fixtures/voice_spans.vtt")
      expect(@vtt.speakers).to eql ["Esme", "Mary"]
    end

  end

  context "can merge colocated(?) cues" do
    
    before :all do
      vtt = WebVTT.read("spec/fixtures/speakers.vtt")
      @cues = vtt.merged_cues
    end
    
    it "by merging cues" do
      expect(@cues.length).to eql 5
      expect(@cues[0].speaker).to eql "Roger Bingham"
      expect(@cues[1].speaker).to eql "Neil deGrasse Tyson"
      expect(@cues[2].speaker).to eql "Roger Bingham"
      expect(@cues[3].speaker).to eql "Neil deGrasse Tyson"
      expect(@cues[4].speaker).to eql "Roger Bingham"
    end

    it "by merging cues with the same speaker" do
      cue = @cues[0]
      expect(cue.text).to eql "We are in New York City We’re actually at the Lucern Hotel, just down the street from the American Museum of Natural History And with me is Neil deGrasse Tyson Astrophysicist, Director of the Hayden Planetarium at the AMNH. Thank you for walking down here. And I want to do a follow-up on the last conversation we did. When we e-mailed—"
    end
    
    it "but leave individual cues unmerged" do
      cue = @cues[1]
      expect(cue.text).to eql "Didn’t we talk about enough in that conversation?"
    end
  end


end