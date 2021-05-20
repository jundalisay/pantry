defmodule PantryWeb.Api.HubView do
  use PantryWeb, :view

  def render("index.json", %{hubs: hubs}) do
    render_many(hubs, PantryWeb.Api.HubView, "map.json")
  end

  def render("map.json", %{hub: hub}) do
    %{
      id:       hub.id, 
      name:  hub.name,
      address: hub.address, 
      avatar: hub.avatar,
      landline: hub.landline,
      slogan: hub.slogan,   
      status: hub.status   
    }
  end  

end
