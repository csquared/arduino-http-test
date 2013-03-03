require 'sinatra/base'

class App < Sinatra::Base
  get '/get' do
    'OK'
  end

  get '/get-header' do
    puts "test_header=#{headers['X-Test-Header']}"
    if headers['X-Test-Header'] == 'true'
      'OK'
    else
      'FAIL'
    end
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
