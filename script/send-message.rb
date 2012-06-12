#!/usr/bin/env ruby

require 'json'
require 'rest_client'
base_url = 'http://localhost:3000'

class MessageSender

  def initialize(host, port, username, password)
    @username = username
    @password = password
    @base_url = "http://#{host}:#{port}"
  end

  def send(title, body, recipient_ids)
    login

    data = {
      'message[title]' => title,
      'message[body]' => body,
      'message[recipient_ids]' => recipient_ids
    }

    create_response = RestClient.post "#{@base_url}/messages.json",
      data
      #{ cookies: @login_response.cookies } 
      { :cookies => { :session_id => @login_response.cookies['_notifier_session'] } }

    raise SendFailed if create_response.code != 201
    JSON.parse(create_response.body)
  end

private
  def login
    @login_response = RestClient.post "#{@base_url}/users/sign_in.json",
      { 'user[username]' => @username, 'user[password]' => @password }

    raise LoginFailed if @login_response.code != 201
    @current_user = JSON.parse(@login_response.body)
  end
end

class LoginFailed < Exception
end

class SendFailed < Exception
end

def main
  sender = MessageSender.new('localhost', 3000, 'bob', '123456')
  puts sender.send('hola!', "hi, what's up?", [1, 2])
end

main if __FILE__ == $0

# login

#user = JSON.parse(login_response.body)
#user_id = user['id']

#session_id = login_response.cookies['_notifier_session']
#puts session_id

##response2 = RestClient.get "#{base_url}/messages.json",
  ##cookies: login_response.cookies

##puts response2

#message = { sender: user_id, title: 'command line message', body: 'Yo!!' }

#puts create_response

##$host = 'localhost'
##$port = '3000'

##username = 'bob'
##password = '123456'


###Net::HTTP.start(uri.host, uri.port) do |http|
  ###request = Net::HTTP::Post.new uri.request_uri

  ###response = http.request request
  ###debugger
  ###puts response
###end




###puts response.code
###puts response.to_hash
###puts response


##def login_and_get_session_id(username, password)
  ##uri = URI("http://#{$host}:#{$port}/users/sign_in.json")
  ##data = { 'user[username]' => username, 'user[password]' => password }
  ##response = Net::HTTP.post_form(uri, data)

  ##raise LoginFailed if response.code != '201'

  ##cookie = response['set-cookie']
  ##cookie.split(';').first
##end

##class LoginFailed < Exception; end


#puts login_and_get_session_id(username, password)
