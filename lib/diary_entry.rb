class DiaryEntry
  attr_accessor :title, :contents

  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @furthest_word_read = 0
  end

  # def title
  #   # Returns the title as a string
  # end

  # def contents
  #   # Returns the contents as a string
  # end

  def count_words
    # Returns the number of words in the contents as an integer
    split_contents.count
  end

  def reading_time(wpm) # wpm is an integer representing
                        # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    fail "WPM has to be above zero." if wpm <= 0
    (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    no_of_words = minutes * wpm
    start_from = @furthest_word_read
    end_at = @furthest_word_read + no_of_words
    chunk = split_contents[start_from, end_at].join(" ")
    if end_at >= count_words
      @furthest_word_read = 0
    else
      @furthest_word_read = end_at
    end
    chunk
  end

  private

  def split_contents
    @contents.split(" ")
  end
end
