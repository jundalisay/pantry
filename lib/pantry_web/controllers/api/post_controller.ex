defmodule PantryWeb.Api.PostController do
  use PantryWeb, :controller

  alias Pantry.Feed

  def index(conn, _params) do
    posts   = Feed.list_posts()
    render(conn, "index.json", posts: posts)    
  end

end
