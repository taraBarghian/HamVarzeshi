defmodule HamVarzeshi.App.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :avatar, :string
    field :email, :string
    field :name, :string
    field :provider, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :avatar, :provider])
    |> validate_required([:name, :email, :avatar, :provider])
  end
end
