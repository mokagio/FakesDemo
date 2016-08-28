require 'sinatra'
require 'json'

get '/login' do
  return ':)'
end

get '/resource/:id' do
  return {
    property: 'this is a fake resource'
  }.to_json
end
