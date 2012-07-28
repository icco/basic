#!/usr/bin/env ruby
# An app for ...
# @author Nat Welch - https://github.com/icco

configure do
  set :sessions, true
  DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/data.db')
end

get '/' do
  erb :index, :locals => {}
end

get '/css/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  less :style
end

get '/id/:id' do
  Entry.filter(:id => params[:id]).first.to_s
end

post '/' do
  redirect '/'
end

class Entry < Sequel::Model(:entries)
end
