require 'bundler'
Bundler.require

require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  # link '/' do
  #   erb :gossip_page
  # end

  
  get '/gossips/:id' do
    Gossip.all.select do |row|
      row.id == params[:id]
    end.first
    erb :gossip_page, locals: {gossip: Gossip.find(params[:id])}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    id = 1
    CSV.foreach("./db/gossip.csv") { |row| id += 1} 
    Gossip.new(id,params["gossip_author"],params["gossip_content"]).save 
    redirect '/'
  end

 

      
end