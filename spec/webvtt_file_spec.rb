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

end