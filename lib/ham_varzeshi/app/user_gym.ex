defmodule HamVarzeshi.App.UserGym do

  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  schema "user_gym" do
    belongs_to :user, HamVarzeshi.App.User
    belongs_to :gym , HamVarzeshi.App.Gym


    timestamps()
  end

  @doc false
  def changeset(user_gym, attrs) do
    user_gym
    |> cast(attrs, [:user_id, :gym_id])
    |> validate_required([:user_id, :gym_id])
  end


end
