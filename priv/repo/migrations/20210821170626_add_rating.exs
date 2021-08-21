defmodule HamVarzeshi.Repo.Migrations.AddRating do
  use Ecto.Migration

  def change do
    alter table(:gyms) do
      add :rating , :float

    end

  end
end
