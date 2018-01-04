require 'user'
require 'file_reader'
require 'distance'

describe User do
  let(:file_path) { File.expand_path('spec/customers_spec.txt') }

  let(:user_obj) { described_class.new(file_path) }

  describe '.file_path' do
    it 'should match the file path' do
      expect(user_obj.file_path).to eq(File.expand_path('spec/customers_spec.txt'))
    end
  end

  describe '.get_user_data' do
    it "should return the user data from file" do
      user_data = user_obj.get_user_data

      expect(user_data).to be_a_kind_of(Array)
      expect(user_data).not_to be_empty
    end
  end

  describe '.get_invitee_list' do
    it "should calculates distance for all the user and filter invitee users" do
      user_list = user_obj.get_invitee_list()

      expect(user_list).to be_a_kind_of(Array)
      expect(user_list.size).to eq(3)
    end
  end
end