defmodule HamVarzeshi.Repo.Migrations.AddUserIdToGym do
  use Ecto.Migration

  def change do

    alter table(:gyms) do
      add :user_id, references(:users)
    end

  end
end
