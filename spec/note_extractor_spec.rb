# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe NoteExtractor do
  let(:multiple_notes_fixture) { File.read('spec/fixtures/multiple_notes.html') }
  let(:no_notes_fixture) { File.read('spec/fixtures/no_notes.html') }

  describe '.extract_from_file' do
    let(:file_path) { 'spec/fixtures/multiple_notes.html' }

    it 'returns an array of notes' do
      notes = NoteExtractor.extract_from_file(file_path)
      expect(notes).to be_an(Array)
      expect(notes.size).to eq(2)
      expect(notes[0]).to eq('- Tasks should be at goal level')
      expect(notes[1]).to eq('- You can also stack things which happen around the same time')
    end
  end

  describe '#extract' do
    context 'when there are highlights and notes' do
      let(:html) { multiple_notes_fixture }
      let(:expected_notes) do
        [
          '- Tasks should be at goal level',
          '- You can also stack things which happen around the same time'
        ]
      end

      it 'returns an array containing the text of each note' do
        expect(NoteExtractor.extract(html)).to eq(expected_notes)
      end
    end

    context 'when there are highlights but no notes' do
      let(:html) { no_notes_fixture }
      let(:expected_notes) { [] }

      it 'returns an empty array' do
        expect(NoteExtractor.extract(html)).to eq(expected_notes)
      end
    end
  end
end
