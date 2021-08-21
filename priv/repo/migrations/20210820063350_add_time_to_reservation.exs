defmodule HamVarzeshi.Repo.Migrations.AddTimeToReservation do
  use Ecto.Migration

  def change do

    alter table(:user_gym) do
      add :day, :string
      add :time, :integer
    end
  end
end
