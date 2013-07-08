require 'open-uri'
require 'json'

class Weather
	#attr_accessible :wale, :philly

	def self.philly
		store={}
		dates = 20130601..20130605
		dates.each do |date|
	        open("http://api.wunderground.com/api/28f03e8b952a4732/history_#{date}/q/PA/Philadelphia.json") do |f|
	                json_string = f.read
	                parsed_json = JSON.parse(json_string)
	                year = parsed_json['history']['observations'][15]['utcdate']['year']
	                month = parsed_json['history']['observations'][15]['utcdate']['mon']
	                day = parsed_json['history']['observations'][15]['utcdate']['mday']
	                hour = parsed_json['history']['observations'][15]['utcdate']['hour']
	                min = parsed_json['history']['observations'][15]['utcdate']['min']
	                sec = '00'
	                tzone = parsed_json['history']['observations'][15]['utcdate']['tzname']
	                
	                key = "#{year}-#{month}-#{day} #{hour}:#{min}:#{sec} #{tzone}"

	                tempi = parsed_json['history']['observations'][15]['tempi']
	                store[key] = tempi.to_i
	        end
		end
		store
	end

	def wale
	end

	def self.me
		"me"
	end
end