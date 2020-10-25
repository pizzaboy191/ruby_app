require 'open-uri'
require 'pry-byebug'
require_relative 'visitor'

class Parser
  attr_reader :path, :visits

  def initialize(path)
    @path = path
    @visits = []
  end

  def parse_file
    File.foreach(@path) do |line|
      page, ip = line.split
      @visits << Visitor.new(page, ip)
    end
  end

  def page_visits
    @visits.group_by{ |value| value.page }
  end

  def count_page_visits
    page_visits.map{ |page, visits| [page, visits.count] }
  end

  def sort_page_visits
    count_page_visits.sort_by{ |h| h.last }.reverse
  end

  def display_page_visits
    sort_page_visits.join(' ')
  end

  def unique_visits
    page_visits.map do |key, value|
      [key, value.map{|e| e.ip}.uniq.count]
    end.sort_by{ |h| h.last }.reverse
  end

  def display_unique_visits
    unique_visits.join(' ')
  end
end

