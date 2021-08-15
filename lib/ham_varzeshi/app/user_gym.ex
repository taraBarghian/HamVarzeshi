defmodule HamVarzeshi.App.UserGym do

  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  schema "users_gyms" do
    belongs_to :user , HamVarzeshi.App.User
    belongs_to :gym , HamVarzeshi.App.Gym


    timestamps()
  end

  @doc false
  def changeset(user_gym, attrs) do
    user_gym
    |> cast(attrs, [:user, :gym])
    |> validate_required([:user, :gym])
  end


end
