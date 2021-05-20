defmodule PantryWeb.PostLive.Index do
  use PantryWeb, :live_view

  alias PantryWeb.LiveCreds
  alias Pantry.{Feed, Feed.Post, Transactions, Transactions.Record}
  

  def get_postuser(id) do
    u = Users.get_user!(id)
  end      


  @impl true
  def mount(_params, session, socket) do
    current_user  = LiveCreds.get_user(socket, session)
    page_title    = "Pantry"
    records       = Transactions.list_records
    posts         = Feed.list_posts
    socket = 
      assign(socket,
        current_user: current_user,
        page_title: page_title,
        posts: posts,
        records: records
      )
    {:ok, socket}
  end


  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :posts, list_posts())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, Feed.get_post!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Post")
    |> assign(:post, %Post{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Posts")
    |> assign(:post, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Feed.get_post!(id)
    {:ok, _} = Feed.delete_post(post)

    {:noreply, assign(socket, :posts, list_posts())}
  end

  defp list_posts do
    Feed.list_posts()
  end
end
