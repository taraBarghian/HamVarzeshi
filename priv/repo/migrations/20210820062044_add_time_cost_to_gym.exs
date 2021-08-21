defmodule HamVarzeshi.Repo.Migrations.AddTimeCostToGym do
  use Ecto.Migration

  def change do
    alter table(:gyms) do
      add :cost, :integer
    end
  end
end
