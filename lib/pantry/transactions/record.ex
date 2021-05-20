defmodule Pantry.Transactions.Record do
  use Ecto.Schema
  import Ecto.Changeset

  schema "records" do
    field :bottle_points, :integer
    field :brands, :string
    field :compost_points, :integer
    field :details, :string
    field :kind, :string
    field :plastic_points, :integer
    field :user_id, :id
    field :recorder_id, :id    
    field :hub_id, :id

    timestamps()
  end

  @doc false
  def changeset(record, attrs) do
    record
    |> cast(attrs, [:details, :brands, :bottle_points, :compost_points, :kind, :plastic_points, :user_id, :hub_id, :recorder_id])
    |> validate_required([:user_id])
  end
end
