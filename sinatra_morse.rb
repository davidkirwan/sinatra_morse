$stdout.sync = true
####################################################################################################
# @author       David Kirwan https://github.com/davidkirwan/sinatra_morse
# @description  Sinatra Morse Code Generator
#
# @date         2015-03-03
####################################################################################################
##### Require statements
require 'sinatra/base'
require 'logger'
require 'json'
require 'puma'
require File.join(File.dirname(__FILE__), '/lib/morse')

module Generator
class App < Sinatra::Base


  ##### Variables
  enable :static, :sessions, :logging
  set :environment, :production
  set :root, File.dirname(__FILE__)
  set :public_folder, File.join(root, '/public')
  set :views, File.join(root, '/views')
  set :server, :puma

  # Create the logger instance
  set :log, Logger.new(STDOUT)
  set :level, Logger::DEBUG
  #set :level, Logger::INFO
  #set :level, Logger::WARN

  # Options hash
  set :options, {:log => settings.log, :level => settings.level}

#########################################################################################################


  not_found do
    [404, {"Content-Type" => "text/plain"},["404 get to fuck"]]
  end

  get '/' do
    erb :index
  end

  post '/generate' do
    [400, {"Content-Type" => "text/plain"},["400 Bad Request"]] unless not params["morse_input"].nil?
    data = Morse.to_morse(params["morse_input"])
    {:data=>data}.to_json
  end

end # End of the App class
end # End of the Generator module
