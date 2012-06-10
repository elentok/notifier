class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender
      t.string :title
      t.text :body

      t.timestamps
    end
    add_index :messages, :sender_id

    create_table :messages_recipients do |t|
      t.references :user
      t.references :message
    end

    add_index :messages_recipients, :user_id
    add_index :messages_recipients, :message_id
  end
end
