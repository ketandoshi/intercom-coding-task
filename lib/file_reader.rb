class FileReader
  require 'json'

  attr_accessor :file_data, :file_path

  def initialize(file_path)
    @file_path = file_path
    @file_data = Array.new
  end

  def get_file_content
    read_file
    @file_data
  end

  def read_file
    File.open(@file_path, 'r') do |file|
      file.each_line do |line|
        @file_data << JSON.parse(line)
      end
    end
  end
end