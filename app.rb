require 'sinatra/base'
$stdout.sync = true

class App < Sinatra::Base
  use Rack::CommonLogger

  get '/get' do
    'OK'
  end

  get '/get-header' do
    test_header
    'OK'
  end

  get '/get-headers' do
    test_two_headers
    'OK'
  end

  [:put, :post, :delete].each do |method|
    self.send(method, '/data') do
      test_post_body
      'OK'
    end

    self.send(method, '/data-header') do
      test_post_body
      test_header
      'OK'
    end

    self.send(method, '/data-headers') do
      test_post_body
      test_two_headers
      'OK'
    end
  end

  private
  def test_header
    header = env['HTTP_X_TEST_HEADER']
    puts "test_header=#{header}"
    halt 420, 'FAIL' unless header == 'true'
  end

  def test_two_headers
    header1 = env['HTTP_X_TEST_HEADER1']
    header2 = env['HTTP_X_TEST_HEADER2']
    puts "header1=#{header1} header2=#{header2}"
    halt 420, 'FAIL' unless header1 == 'one' && header2 == 'two'
  end

  def test_post_body
    postbody = request.body.read
    puts "body=#{postbody}"
    halt 420, 'FAIL' unless postbody == "POSTDATA"
  end
end
