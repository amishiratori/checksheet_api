require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'
require 'json'

get '/api/getprefecture' do
    prefectures = []
    Prefecture.all.each do |prefecture|
        pref = {}
        pref['name'] = prefecture.name
        pref['capital'] = prefecture.capital
        pref['flower'] = prefecture.flower
        prefectures.push(pref)
    end
    response = {'results': { 'prefecture': prefectures } }
    response = JSON.pretty_generate(response)
    return response
end


get '/api/getfruits' do
    fruits = []
    fruits.push({'name': 'りんご', 'color': '赤'})
    fruits.push({'name': 'ぶどう', 'color': '紫'})
    fruits.push({'name': 'みかん', 'color': 'オレンジ'})
    response = {'response': {'fruits': fruits}}
    response = JSON.pretty_generate(response)
    return response
end