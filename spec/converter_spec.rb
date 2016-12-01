require 'vtt2an'
require 'rexml/xpath'

RSpec.describe Vtt2An::Converter do

  context "Akoma Ntoso basics" do
    
    before :all do
      vtt = WebVTT.read("spec/fixtures/ota.vtt")
      converter = Vtt2An::Converter.new(vtt)
      @an = converter.convert
    end

    it "should have right root tag" do
      expect(@an.root.name).to eql "akomaNtoso"
    end

    it "should have references tag for speaker details" do
      expect(REXML::XPath.first(@an.root, "/akomaNtoso/debate/meta/references").name).to eql "references"
    end

    it "should have a TLCPerson tag for the speaker" do
      speakers = REXML::XPath.match(@an.root, "/akomaNtoso/debate/meta/references/TLCPerson")
      expect(speakers.size).to eql 1
      expect(speakers.first.attributes["showAs"]).to eql "Speaker"
      expect(speakers.first.attributes["id"]).to eql "speaker"
    end

    it "should have debate heading" do
      expect(REXML::XPath.first(@an.root, "/akomaNtoso/debate/debateBody/debateSection/heading").text).to eql "Title"
    end

    it "should create a speech for the cue content" do
      speeches = REXML::XPath.match(@an.root, "/akomaNtoso/debate/debateBody/debateSection/speech")
      expect(speeches.size).to eql 1
      expect(speeches[0].children[0].name).to eql "p"
      expect(speeches[0].children[0].text).to include "The network revolution"
    end

  end
  
  context "Creating multi-speaker AN files" do

    before :all do
      vtt = WebVTT.read("spec/fixtures/speakers.vtt")
      converter = Vtt2An::Converter.new(vtt)
      @an = converter.convert
    end

    it "should have a TLCPerson tag for each speaker" do
      speakers = REXML::XPath.match(@an.root, "/akomaNtoso/debate/meta/references/TLCPerson")
      expect(speakers.size).to eql 2
      expect(speakers[0].attributes["showAs"]).to eql "Roger Bingham"
      expect(speakers[1].attributes["showAs"]).to eql "Neil deGrasse Tyson"
    end

    it "should create speeches for each bit of cue content" do
      speeches = REXML::XPath.match(@an.root, "/akomaNtoso/debate/debateBody/debateSection/speech")
      expect(speeches.size).to eql 5
    end

  end

end