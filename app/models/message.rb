class Message < ActiveRecord::Base
  belongs_to :sender
  has_and_belongs_to_many :recipients, 
    class_name: 'User', join_table: 'messages_recipients'
  attr_accessible :body, :title
end
