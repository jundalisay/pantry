defmodule Pantry.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :landline, :string
      add :mobile, :string
      add :email, :string
      add :address, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:companies, [:user_id])
  end
end
