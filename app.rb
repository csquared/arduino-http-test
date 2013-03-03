require 'sinatra/base'

class App < Sinatra::Base
  get '/get' do
    'OK'
  end

  get '/get-header' do
    header = env['X-Test-Header']
    puts "test_header=#{header}"
    if header == 'true'
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
