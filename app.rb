require 'sinatra/base'
$stdout.sync = true

class App < Sinatra::Base
  get '/get' do
    puts "/get"
    'OK'
  end

  get '/get-header' do
    puts "/get-header"
    test_header
    'OK'
  end

  post '/post' do
    puts "/post"
    test_post_body
    'OK'
  end

  post '/post-headers' do
    puts '/post-headers'
    test_post_body
    test_header
    'OK'
  end

  private
  def test_header
    header = env['HTTP_X_TEST_HEADER']
    puts "test_header=#{header}"
    halt 420, 'FAIL' unless header == 'true'
  end

  def test_post_body
    postbody = request.body.string
    puts "body=#{postbody}"
    halt 420, 'FAIL' unless postbody == "POSTDATA"
  end
end
