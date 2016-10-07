class SearchController < ApplicationController
  def create
  	palabra = "%#{params[:keyword]}%"
  	@places = Place.where("nombre LIKE ? OR ciudad LIKE ?",palabra,palabra)
  	#@voters = Voter.where("cedula LIKE ?",palabra,palabra)

  	respond_to do |format|
  		format.html { redirect_to "/main/index" }
  		format.json {  render json: @places}
  		format.js 
  	end
  end
  def ocreate
    palabra = "%#{params[:keyword]}%"
    #@places = Place.where("nombre LIKE ? OR ciudad LIKE ?",palabra,palabra)
    #@v = Voter.select("id").where("cedula LIKE ?",palabra)
    @voter = Voter.select("place_id,nombre").where("cedula LIKE ?",palabra)
    @i = 1
    #@places = Place.find(params[:place_id])
    #@place = Place.find(@v)

    respond_to do |format|
      format.html { redirect_to "/main/cedula" }
      format.json {  render json: @voter}
      format.js 
    end
  end

  def votar
    $pid = "#{params[:pid]}"
  end

  def ucreate
    palabra = "%#{params[:keyword]}%"
    @voter = Voter.select("id,nombre,havotado").where("cedula LIKE ? AND place_id LIKE ?",palabra,$pid)
    
    if @voter.empty? 
      @voter = Voter.select("place_id,nombre").where("cedula LIKE ?",palabra)
      @i = 3
    else
      @i = 2
    end
    respond_to do |format|
      format.html { redirect_to "/main/votar" }
      format.json {  render json: @voter}
      format.js 
    end
  end
  
  def getvotes
    palabra = "#{params[:option]}"
    @idm = Place.select("id").where("nombre = ?",palabra)
    @idm = @idm.to_a
    puts @idm
    @stats = Stat.where("idmesa = ?",@idm)
    @yesm = 0
    @nom = 0
    @stats.each do |stat|
      @yesm = @yesm + stat.vote_yes
      @nom = @nom + stat.vote_no
    end
    @numvotes = [@yesm,@nom]
    #puts @numvotes

      respond_to do |format|
          format.html { redirect_to "/stats/index" }
          format.json { render json: @numvotes}
          format.js 
      end
  end
end
