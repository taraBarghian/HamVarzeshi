defmodule HamVarzeshi.Repo.Migrations.GymUserReservation do
  use Ecto.Migration

  def change do
    create table(:user_gym) do
      add :user_id, references(:users)
      add :gym_id, references(:users)

      timestamps()
    end
  end
end
