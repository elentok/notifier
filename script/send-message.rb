#!/usr/bin/env ruby

require 'pry'

require 'json'
require 'rest_client'
base_url = 'http://localhost:3000'

class MessageSender

  def initialize(host, port, username, password)
    #@username = username
    #@password = password
    @base_url = "http://#{username}:#{password}@#{host}:#{port}"
  end

  def send(title, body, recipient_ids)
    data = {
      'message[title]' => title,
      'message[body]' => body,
      'message[recipient_ids]' => recipient_ids
    }

    create_response = RestClient.post "#{@base_url}/messages.json",
      data

    raise SendFailed if create_response.code != 201
    JSON.parse(create_response.body)
  end
end

class SendFailed < Exception
end

def main
  sender = MessageSender.new('localhost', 3000, 'bob', '123456')
  puts sender.send('hola!', "hi, what's up?", [1, 2])
end

main if __FILE__ == $0
