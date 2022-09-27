require 'diary'

RSpec.describe Diary do
  context "no entries" do
    it "returns an empty array" do
      diary = Diary.new
      expect(diary.all).to eq []
    end
  end

  context "reading time that is equal to or less than 0" do
    it "fails" do
      diary = Diary.new
      expect{ diary.reading_time(0) }.to raise_error "WPM has to be above zero."
    end
  end

  context "contents is empty" do
    it "returns 0" do
      diary = Diary.new
      expect(diary.reading_time(2)).to eq 0
    end
  end

  context "contents is empty" do
    it "returns nil" do
      diary = Diary.new
      expect(diary.find_best_entry_for_reading_time(2, 1)).to eq nil
    end
  end
end
