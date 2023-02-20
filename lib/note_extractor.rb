# frozen_string_literal: true

# This is a class that extracts notes from a Kindle HTML file.
class NoteExtractor
  # Extracts notes from a Kindle HTML file.
  #
  # @param file_path [String] the path to the Kindle HTML file
  # @return [Array] an array of notes
  def self.extract_from_file(file_path)
    html = File.read(file_path)
    extract(html)
  end

  # Extracts notes from a Kindle HTML string.
  # @param html [String] the Kindle HTML String
  # @return [Array] an array of notes
  def self.extract(html)
    notes = html.scan(%r{<h3.*?>Note.*?</div><div.*?>(.*?)</h3>}mi).flatten
    notes.map { |note| "- #{note}" }
  end
end
