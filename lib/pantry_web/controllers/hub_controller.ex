defmodule PantryWeb.HubController do
  use PantryWeb, :controller

  alias Pantry.Orgs
  alias Pantry.Orgs.Hub

  def index(conn, _params) do
    hubs = Orgs.list_hubs()
    render(conn, "index.html", hubs: hubs)
  end

  def new(conn, _params) do
    changeset = Orgs.change_hub(%Hub{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"hub" => hub_params}) do
    case Orgs.create_hub(hub_params) do
      {:ok, hub} ->
        conn
        |> put_flash(:info, "Hub created successfully.")
        |> redirect(to: Routes.hub_path(conn, :show, hub))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hub = Orgs.get_hub!(id)
    render(conn, "show.html", hub: hub)
  end

  def edit(conn, %{"id" => id}) do
    hub = Orgs.get_hub!(id)
    changeset = Orgs.change_hub(hub)
    render(conn, "edit.html", hub: hub, changeset: changeset)
  end

  def update(conn, %{"id" => id, "hub" => hub_params}) do
    hub = Orgs.get_hub!(id)

    case Orgs.update_hub(hub, hub_params) do
      {:ok, hub} ->
        conn
        |> put_flash(:info, "Hub updated successfully.")
        |> redirect(to: Routes.hub_path(conn, :show, hub))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", hub: hub, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hub = Orgs.get_hub!(id)
    {:ok, _hub} = Orgs.delete_hub(hub)

    conn
    |> put_flash(:info, "Hub deleted successfully.")
    |> redirect(to: Routes.hub_path(conn, :index))
  end
end
