class MainController < ApplicationController
  def index
  end

  def hola
  	@saludo = "hola world"
  end

  def folleto
    @voter = Voter.find(params[:id])
    @voter.havotado = "si"
    @voter.save
    puts @voter
  end
end
