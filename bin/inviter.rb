require 'optparse'
require_relative '../lib/user'
require_relative '../lib/file_reader'
require_relative '../lib/distance'

file_name = 'customers.txt'

puts "Start collecting user data from #{file_name} file (Y/N)?"

ARGF.each do |line|

  if line.upcase =~ /Y\n/
    begin
      puts 'Invited Users List::'
      puts '-'*20
      User.new(File.expand_path(file_name)).get_invitee_list()
    rescue StandardError
      p 'No option'
    end
  end

end