defmodule Pantry.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema,
    password_min_length: 6

  import Ecto.Changeset  

  schema "users" do
    pow_user_fields()
    field :name, :string
    field :pin, :integer    
    field :avatar, :string
    field :role, :string, null: false, default: "ordinary"
    field :gender, :string
    field :mobile, :string
    timestamps()
  end


  # @spec changeset_role(Ecto.Schema.t() | Ecto.Changeset.t(), map()) :: Ecto.Changeset.t()
  # def changeset_role(user_or_changeset, attrs) do
  #   user_or_changeset
  #   |> Ecto.Changeset.cast(attrs, [:role])
  #   |> Ecto.Changeset.validate_inclusion(:role, ~w(user admin))
  # end

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> cast(attrs, [:name, :avatar, :gender, :mobile, :role, :pin])    
    |> pow_changeset(attrs)
    # |> pow_extension_changeset(attrs)
    |> validate_required([:name, :avatar, :pin])    
  end  
end
