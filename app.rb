require 'rubygems'
require 'bundler'
require "sinatra/reloader"

Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Citibike
	class App < Sinatra::Application
    configure :development do
      register Sinatra::Reloader
    end

    before do
      json = File.open("data/citibikenyc.json").read
      @data = MultiJson.load(json)
      @data.each do |station|
        station["lat"] = station["lat"]/1000000.to_f
        station["lng"] = station["lng"]/1000000.to_f
      end
    end

    get '/' do

      erb :home
    end

    get '/form' do

      erb :form
    end

    post '/map' do
      @start = params["start"]
      @end = params["end"]
      
      erb :map
    end

  end
end