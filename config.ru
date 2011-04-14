require 'rubygems'
require 'bundler'

Bundler.require

require './site'
run Sinatra::Application
