require 'diary_entry'
require 'diary'

RSpec.describe "Integration Tests" do
  context "all" do
    it "returns all diary entries" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("1", "BRO")
      diary_entry2 = DiaryEntry.new("2", "HIIIII")
      diary_entry3 = DiaryEntry.new("3", "BYEEEE")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      diary.add(diary_entry3)
      expect(diary.all).to eq [diary_entry1, diary_entry2, diary_entry3]
    end
  end

  context "counts words" do
    it "returns no. of words in all entries" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("1", "BRO HI")
      diary_entry2 = DiaryEntry.new("2", "HIIIII YOU")
      diary_entry3 = DiaryEntry.new("3", "BYEEEE")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      diary.add(diary_entry3)
      expect(diary.count_words).to eq 5
    end
  end

  context "reading time" do
    it "returns reading time of all entries" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("1", "BRO HI")
      diary_entry2 = DiaryEntry.new("2", "HIIIII YOU")
      diary_entry3 = DiaryEntry.new("3", "BYEEEE")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      diary.add(diary_entry3)
      expect(diary.reading_time(2)).to eq 3
    end

    it "returns reading time of all entries" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("1", "BRO HI 1")
      diary_entry2 = DiaryEntry.new("2", "HIIIII YOU 2")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      expect(diary.reading_time(2)).to eq 3
    end
  end

  context "find best entry for reading time" do
    it "returns the only entry when it fits" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("1", "BRO HI 1")
      diary.add(diary_entry1)
      expect(diary.find_best_entry_for_reading_time(3, 1)). to eq diary_entry1
    end

    it "returns nil with entry that is unreadable in given time" do
      diary = Diary.new
      diary.add(DiaryEntry.new("1", "BRO HI 1"))
      expect(diary.find_best_entry_for_reading_time(1, 2)). to eq nil
    end

    it "returns nil with entry that is unreadable in given time" do
      diary = Diary.new
      diary.add(DiaryEntry.new("1", "BRO HI 1 more"))
      expect(diary.find_best_entry_for_reading_time(3, 1)). to eq nil
    end

    it "returns longest entry that is readable" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("2", "BRO HI")
      diary_entry2 = DiaryEntry.new("1", "BRO HI 2")
      diary_entry3 = DiaryEntry.new("3", "BRO")
      diary_entry4 = DiaryEntry.new("4", "BRO HI 4 NO WAY I WON'T FIT")
      diary.add(diary_entry1)
      diary.add(diary_entry2)
      diary.add(diary_entry3)
      diary.add(diary_entry4)
      expect(diary.find_best_entry_for_reading_time(3, 1)). to eq diary_entry2
    end

    it "fails when wpm is 0" do
      diary = Diary.new
      diary_entry1 = DiaryEntry.new("2", "BRO HI")
      diary.add(diary_entry1)
      expect{ diary.find_best_entry_for_reading_time(0, 1) }. to raise_error "WPM has to be above zero."
    end
  end
end
