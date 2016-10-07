class StatsController < ApplicationController
	def index
		@stats = Stat.all
		@places = Place.all
	end
	def show
		
	end
	def salida
		vote1 = "#{params[:voto1]}"
		vote2 = "#{params[:voto2]}"
		@voto = Stat.create(vote_yes: vote1, vote_no: vote2, idmesa: $pid)	
	end
end
