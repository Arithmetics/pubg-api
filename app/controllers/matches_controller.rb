class MatchesController < ApplicationController

  def show
    client = RUBG::Client.new({ api_key: Figaro.env.pubg_api_key })
    args = {:shard => "pc-na", :query_params => {:match_id => params[:id]}}
    response = client.match(args)
    render json: response
  end



  private

  def match_params
    params.require(:player).permit(:id)
  end

end
