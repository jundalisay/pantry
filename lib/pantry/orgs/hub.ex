defmodule Pantry.Orgs.Hub do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hubs" do
    field :address, :string
    field :avatar, :string
    field :email, :string
    field :facebook, :string
    field :kind, :string
    field :landline, :string
    field :latitude, :decimal
    field :longitude, :decimal
    field :mobile, :string
    field :name, :string
    field :slogan, :string
    field :status, :string    
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(hub, attrs) do
    hub
    |> cast(attrs, [:name, :address, :kind, :avatar, :email, :facebook, :latitude, :longitude, :mobile, :landline, :slogan, :status])
    |> validate_required([:name])
  end
end
