defmodule HamVarzeshi.App.Gym do
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  schema "gyms" do
    field :avatar, HamVarzeshi.Avatar.Type
    field :description, :string
    field :name, :string

    belongs_to :user , HamVarzeshi.App.User

    timestamps()
  end

  @doc false
  def changeset(gym, attrs) do
    gym
    |> cast(attrs, [:name, :description])
    |> cast_attachments(attrs,[:avatar])
    |> validate_required([:name, :description])
  end
end
