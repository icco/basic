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

get '/:id' do
  Entry.filter(:id => params[:id]).first.to_s
end

post '/' do
  redirect '/'
end

get '/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  less :style
end

class Entry < Sequel::Model(:entries)
end
