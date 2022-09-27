require 'diary_entry'

RSpec.describe DiaryEntry do
  context "title" do
    it "returns the title of the diary entry" do
      diary_entry = DiaryEntry.new("1", "Hiii")
      expect(diary_entry.title).to eq "1"
    end
  end

  context "contents" do
    it "returns the contents of the diary entry" do
      diary_entry = DiaryEntry.new("1", "Hiii")
      expect(diary_entry.contents).to eq "Hiii"
    end
  end

  context "count words" do
    it "returns no. of words in an entry" do
      diary_entry = DiaryEntry.new("1", "BRO HI")
      expect(diary_entry.count_words).to eq 2
    end

    it "returns 0 if string is empty" do
      diary_entry = DiaryEntry.new("1", "")
      expect(diary_entry.count_words).to eq 0
    end

    it "returns 0 if string is empty" do
      diary_entry = DiaryEntry.new("1", " ")
      expect(diary_entry.count_words).to eq 0
    end
  end

  context "reading time" do
    it "returns reading time of entry 2" do
      diary_entry = DiaryEntry.new("1", "Hi, how are you?")
      expect(diary_entry.reading_time(2)).to eq 2
    end

    it "returns reading time of entry 1" do
      diary_entry = DiaryEntry.new("1", "Hi, how are you?")
      expect(diary_entry.reading_time(5)).to eq 1
    end

    it "returns reading time of entry 1" do
      diary_entry = DiaryEntry.new("1", "Hi, how are you?")
      expect(diary_entry.reading_time(4)).to eq 1
    end

    it "returns reading time of entry 4" do
      diary_entry = DiaryEntry.new("1", "Hi, how are you?")
      expect(diary_entry.reading_time(1)).to eq 4
    end

    it "returns reading time of entry 0" do
      diary_entry = DiaryEntry.new("1", "")
      expect(diary_entry.reading_time(1)).to eq 0
    end

    it "fails" do
      diary_entry = DiaryEntry.new("1", "Hi, how are you?")
      expect{ diary_entry.reading_time(0) }.to raise_error "WPM has to be above zero."
    end
  end

  context "reading chunk" do
    it "returns the reading chunk that fits in the time" do
      diary_entry = DiaryEntry.new("1", "Hi, how are you? My name is Bob. I love to eat food.")
      expect(diary_entry.reading_chunk(2, 5)).to eq "Hi, how are you? My name is Bob. I love"
    end

    it "returns the next reading chunk that fits in the time" do
      diary_entry = DiaryEntry.new("1", "Hi, how are you? My name is Bob. I love to eat food.")
      diary_entry.reading_chunk(2, 5)
      expect(diary_entry.reading_chunk(2, 5)).to eq "to eat food."
    end

    it "returns the beginning of the reading chunk that fits in the time" do
      diary_entry = DiaryEntry.new("1", "Hi, how are you? My name is Bob. I love to eat food.")
      diary_entry.reading_chunk(2, 5)
      diary_entry.reading_chunk(2, 5)
      expect(diary_entry.reading_chunk(2, 2)).to eq "Hi, how are you?"
    end
  end
end
