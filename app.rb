require 'sinatra/base'

class App < Sinatra::Base
  get '/get' do
    'OK'
  end

  get '/get-header' do
    puts env['HTTP_X_TEST_HEADER']
    puts env['HTTP_X-Test-Header']
    puts env.inspect

    header = env['HTTP_X_TEST_HEADER']
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
