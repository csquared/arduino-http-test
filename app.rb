require 'sinatra/base'

class App < Sinatra::Base
  get '/get' do
    'OK'
  end

  post '/post' do
    if request.body == "POSTDATA"
      'OK'
    else
      'FAIL'
    end
  end
end
