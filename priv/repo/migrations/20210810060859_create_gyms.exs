defmodule HamVarzeshi.Repo.Migrations.CreateGyms do
  use Ecto.Migration

  def change do
    create table(:gyms) do
      add :name, :string
      add :avatar, :string
      add :description, :string

      timestamps()
    end

  end
end
