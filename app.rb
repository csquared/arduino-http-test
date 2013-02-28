require 'sinatra'

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
