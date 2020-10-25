require "parser"

describe Parser do
  before :each do
    @file = Parser.new('spec/test_dataset.log')
  end

  describe 'initialize' do
    it 'should create an instance of Parser with a path and an empty array of visits' do
      # file = Parser.new('webserver.log')
      expect(@file.path).to eq 'spec/test_dataset.log'
      expect(@file.visits).to eq([])
    end
  end

  describe '#parse_file' do
    it 'iterates over file and creates a Visitor instance' do
      @file.parse_file
      expect(@file.visits.count).not_to eq 0
      expect(@file.visits).to include(Visitor)
    end
  end

  describe '#page_visits' do
    it 'groups visits by page' do
      @file.parse_file
      expect(@file.visits).to_not eq 0
      expect(@file.visits[0].ip).to eq '1.2.3.4.5'
    end
  end

  describe '#count_page_visits' do
    it 'should count the number of page visits' do
      @file.parse_file
      expect(@file.page_visits.count).to eq 3
    end
  end

  describe '#sort_page_visits' do
    it 'should sorts page visits in descending order' do
      @file.parse_file
      expect(@file.sort_page_visits).to eq ([['/contact', 2], ['/help_page', 2], ['/index', 1]])
    end
  end

  describe '#unique_visits' do
    it 'should remove duplicate ip addresses and sort in descending order' do
      @file.parse_file
      expect(@file.unique_visits).to eq ([['/help_page', 2],['/index', 1],['/contact', 1]])
    end
  end
end





