require 'file_reader'

describe FileReader do
  let(:file_path) { File.expand_path('spec/customers_spec.txt') }

  let(:file_reader_obj) { described_class.new(file_path) }

  describe '#get_file_content' do
    it 'should return file content' do
      file_content = file_reader_obj.get_file_content

      expect(file_content).to be_a_kind_of(Array)
      expect(file_content).not_to be_empty
    end
  end

  describe '.file_path' do
    it 'should match the file path' do
      expect(file_reader_obj.file_path).to eq(File.expand_path('spec/customers_spec.txt'))
    end
  end

  describe '.file_data' do
    it 'should return file content' do
      file_reader_obj.get_file_content

      expect(file_reader_obj.file_data).to be_a_kind_of(Array)
      expect(file_reader_obj.file_data).not_to be_empty
    end
  end
end