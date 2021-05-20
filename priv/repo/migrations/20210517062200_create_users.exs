defmodule Pantry.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :password_hash, :string

      add :name,    :string
      add :avatar,  :string
      add :pin,     :integer      
      add :role,    :string, null: false, default: "ordinary"
      add :gender,  :string
      add :mobile,  :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
