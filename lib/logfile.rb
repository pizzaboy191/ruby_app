require_relative 'parser'
# File entered as argument e.g.: ./logfile.rb webserver.log

log_file = Parser.new(ARGV[0])
log_file.parse_file

puts "Most Pages Views: \n #{log_file.display_page_visits} "
puts "Unique Page Views: \n #{log_file.display_unique_visits}"
