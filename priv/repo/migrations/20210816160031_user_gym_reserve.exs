defmodule HamVarzeshi.Repo.Migrations.UserGymReserve do
  use Ecto.Migration

  def change do
    create table(:user_gym) do
      add :user_id, references(:users, on_delete: :delete_all )
      add :gym_id, references(:gyms, on_delete: :delete_all)

      timestamps()
    end


    create  unique_index(:user_gym, [ :user_id, :gym_id]) end

end
