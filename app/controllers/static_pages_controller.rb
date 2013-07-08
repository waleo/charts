class StaticPagesController < ApplicationController
	def home
		@weather = Weather.philly
	end
end
