defmodule Pantry.Feed.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :kind, :string
    field :username, :string
    field :userpic, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:content, :kind, :username, :userpic])
    |> validate_required([:content])
  end
end
