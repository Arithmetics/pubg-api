class PlayersController < ApplicationController

  def index
    @test = "heheh"
  end

  def show
    client = RUBG::Client.new({ api_key: Figaro.env.pubg_api_key })
    args = {:shard => "pc-na", :query_params => {:player_names => params[:id]}}
    response = client.players(args)
    player = response.players.first
    render json: player
  end


  private

  def player_params
    params.require(:player).permit(:name, :id)
  end

end
