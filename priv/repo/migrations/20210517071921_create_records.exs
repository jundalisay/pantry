defmodule Pantry.Repo.Migrations.CreateRecords do
  use Ecto.Migration

  def change do
    create table(:records) do
      add :details, :string
      add :brands, :string
      add :bottle_points, :integer
      add :compost_points, :integer
      add :kind, :string      
      add :plastic_points, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :recorder_id, references(:users, on_delete: :nothing)      
      add :hub_id, references(:hubs, on_delete: :nothing)

      timestamps()
    end

    create index(:records, [:user_id])
    create index(:records, [:hub_id])
    create index(:records, [:recorder_id])    
  end
end
