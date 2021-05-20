defmodule PantryWeb.Api.PostView do
  use PantryWeb, :view

  def render("index.json", %{posts: posts}) do
    render_many(posts, PantryWeb.Api.PostView, "map.json")
  end

  def render("map.json", %{post: post}) do
    %{
      id:       post.id, 
      content:  post.content,
      username: post.username,
      userpic:  post.userpic,
      # date:     post.inserted_at,
    }
  end  

end
