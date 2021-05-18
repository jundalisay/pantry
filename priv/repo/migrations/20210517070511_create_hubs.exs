defmodule Pantry.Repo.Migrations.CreateHubs do
  use Ecto.Migration

  def change do
    create table(:hubs) do
      add :name, :string
      add :address, :string
      add :kind, :string
      add :avatar, :string
      add :email, :string
      add :facebook, :string
      add :latitude, :decimal
      add :longitude, :decimal
      add :mobile, :string
      add :landline, :string
      add :slogan, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:hubs, [:user_id])
  end
end
