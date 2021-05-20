defmodule Pantry.Orgs.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :avatar, :string
    field :address, :string
    field :email, :string
    field :landline, :string
    field :mobile, :string
    field :name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :landline, :mobile, :email, :address, :avatar])
    |> validate_required([:name])
  end
end
