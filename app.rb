require 'sinatra/base'

class App < Sinatra::Base
  get '/get' do
    'OK'
  end

  get '/get-header' do
    test_header
    'OK'
  end

  post '/post' do
    test_post_body
    'OK'
  end

  post '/post-headers' do
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
