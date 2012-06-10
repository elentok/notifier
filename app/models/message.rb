class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  has_and_belongs_to_many :recipients, 
    class_name: 'User', 
    join_table: 'messages_recipients'

  attr_accessible :body, :title

  def self.to_user(user_id)
    Message.includes(:recipients).where(users: { id: user_id })
  end
end
