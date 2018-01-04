class User
  attr_accessor :file_path, :user_data, :invited_users, :response

  DISTANCE_LIMIT = 100  # Needs to filter within 100 kms only

  def initialize(file_path)
    @file_path = file_path
    @user_data = Array.new
    @invited_users = Array.new
    @response = Hash.new
  end

  def get_invitee_list
    get_user_data
    get_user_distance_data
    format_response
  end

  def get_user_data
    @user_data = FileReader.new(@file_path).get_file_content
  end

  def get_user_distance_data
    @user_data.each do |user_info|
      distance = Distance.new(
        user_info['latitude'],
        user_info['longitude']
      ).calculate_distance

      @invited_users << {
        'user_id': user_info['user_id'],
        'name': user_info['name']
      } if distance <= DISTANCE_LIMIT

      @invited_users.sort_by! { |k| k[:user_id] }
    end
  end

  def format_response
    @invited_users.each do |user|
      puts "#{user[:name]} - #{user[:user_id]}"
    end
  end

end