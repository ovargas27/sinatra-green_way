require 'sinatra/base'

class Hello < Sinatra::Base
  get '/' do
    "It's alive!"
  end
end
