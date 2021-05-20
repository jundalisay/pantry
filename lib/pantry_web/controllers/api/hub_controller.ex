defmodule PantryWeb.Api.HubController do
  use PantryWeb, :controller

  alias Pantry.Feed
  alias Pantry.Orgs


  def index(conn, _params) do
    hubs   = Orgs.list_hubs()
    # json(conn, posts)
    render(conn, "index.json", hubs: hubs)    
  end


end
