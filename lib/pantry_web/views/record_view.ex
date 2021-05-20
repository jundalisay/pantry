defmodule PantryWeb.RecordView do
  use PantryWeb, :view

  alias Pantry.Users

  
  def getowner(id) do
    Users.get_user!(id)
  end 
  
end
