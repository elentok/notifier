module CucumberMessageHelper
  def create_messages_from_table(messages_table)
    messages_table.hashes.reverse_each do |message|
      message[:recipients] = load_message_recipients(message[:recipients])
      Fabricate(:message, message)
    end
  end

  def load_message_recipients(names)
    return [] if names.nil? || names.empty?
    names = names.split(',') if names.is_a? String

    names.map do |username|
      User.find_by_username(username.strip)
    end
  end

end

World(CucumberMessageHelper)
