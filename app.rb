require 'sinatra/base'

class App < Sinatra::Base
  get '/get' do
    'OK'
  end

  get '/get-header' do
    header = env['HTTP_X_TEST_HEADER']
    puts "test_header=#{header}"
    if header == 'true'
      'OK'
    else
      'FAIL'
    end
  end

  post '/post' do
    postbody = request.body.string
    puts "body=#{postbody}"
    if postbody == "POSTDATA"
      'OK'
    else
      'FAIL'
    end
  end
end
