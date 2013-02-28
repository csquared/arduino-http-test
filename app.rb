require 'sinatra/base'

class App < Sinatra::Base
  before do
    puts "body=#{request.body.read}"
  end

  get '/get' do
    'OK'
  end

  post '/post' do
    request.body.rewind
    if request.body.read == "POSTDATA"
      'OK'
    else
      'FAIL'
    end
  end
end
