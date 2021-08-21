defmodule HamVarzeshi.Repo.Migrations.AddCounter do
  use Ecto.Migration

  def change do
    alter table(:gyms) do
      add :counter , :integer
    end

  end
end
