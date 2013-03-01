require 'sinatra/base'

class App < Sinatra::Base
  get '/get' do
    'OK'
  end

  post '/post' do
    puts "body=#{request.body.string}"
    if request.body.string == "POSTDATA"
      'OK'
    else
      'FAIL'
    end
  end
end
