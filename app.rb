require 'sinatra/base'

class App < Sinatra::Base
  before do
    puts "body=#{request.body}"
  end

  get '/get' do
    'OK'
  end

  post '/post' do
    if request.body.read == "POSTDATA"
      'OK'
    else
      'FAIL'
    end
  end
end
